import 'package:aqueduct/aqueduct.dart';
import 'package:demo/demo.dart';
import 'package:demo/model/word.dart';

class WordsController extends ResourceController {
  WordsController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllWords({@Bind.query('word') String word}) async {
    final wordQuery = Query<Word>(context);

    if (word != null) {
      wordQuery.where((w) => w.word).contains(word, caseSensitive: false);
    }
    final words = await wordQuery.fetch();

    return Response.ok(words);
  }

  @Operation.get('id')
  Future<Response> getWordByID(@Bind.path('id') int id) async {
    final wordQuery = Query<Word>(context)..where((w) => w.id).equalTo(id);

    final word = await wordQuery.fetchOne();

    if (word == null) {
      return Response.notFound();
    }

    return Response.ok(word);
  }

  @Operation.post()
  Future<Response> addWord(@Bind.body(ignore: ["id"]) Word inputWord) async {
    final query = Query<Word>(context)..values = inputWord;

    final insertedWord = await query.insert();

    return Response.ok(insertedWord);
  }

  @Operation.put('id')
  Future<Response> updateWord(@Bind.path('id') int id,
      @Bind.body(ignore: ["id"]) Word updateWord) async {
    final query = Query<Word>(context)
      ..values = updateWord
      ..where((w) => w.id).equalTo(id);
    final updatedWord = await query.updateOne();

    if (updatedWord == null) {
      return Response.notFound();
    }

    return Response.ok(updatedWord);
  }

  @Operation.delete('id')
  Future<Response> deleteWord(@Bind.path('id') int id) async {
    final query = Query<Word>(context)
      ..where((w) => w.id).equalTo(id);
    final int usersDeleted = await query.delete();

    if (usersDeleted == 0) {
      return Response.notFound();
    }

    final response = {"message": "deleted $usersDeleted user"};
    return Response.ok(response);
  }
}
