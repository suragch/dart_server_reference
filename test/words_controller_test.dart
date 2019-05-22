import 'package:demo/model/word.dart';
import 'harness/app.dart';

void main() {
  final harness = Harness()..install();

  test("GET /words returns 200 OK", () async {
    final query = Query<Word>(harness.application.channel.context)
      ..values.word = "cat"
      ..values.content = Document({"description": "small animal with horns"});

    await query.insert();

    final response = await harness.agent.get("/words");
    expectResponse(response, 200,
        body: allOf([
          hasLength(greaterThan(0)),
          everyElement({
            "id": greaterThan(0),
            "word": isString,
            "content": isString,
          })
        ]));
  });

  test("POST /words returns 200 OK", () async {
    final response = await harness.agent.post("/words", body: {
      "word": "cat",
      "info": "small lion",
    });
    expectResponse(response, 200, body: {
      "id": greaterThan(0),
      "word": "cat",
      "info": "small lion",
    });

    final badResponse = await harness.agent.post("/words", body: {
      "word": "cat",
      "info": "small lion",
    });
    expectResponse(badResponse, 409);
  });
}
