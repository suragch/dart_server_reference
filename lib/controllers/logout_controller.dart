import 'package:aqueduct/aqueduct.dart';
import 'package:aqueduct/managed_auth.dart';

class LogoutController extends ResourceController {
  LogoutController(this.context);

  final ManagedContext context;

  @Operation.delete()
  Future<Response> deleteTokens(@Bind.header('authorization') String authHeader) async {

    final parser = AuthorizationBearerParser();
    final userToken = parser.parse(authHeader);

    final query = Query<ManagedAuthToken>(context)
      //..where((token) => token.resourceOwner).identifiedBy(userId);
      ..where((token) => token.accessToken).equalTo(userToken);

    final count = await query.delete();

    final userId = request.authorization.ownerID;
    return Response.ok({"userId": userId, "tokensDeleted": count});
  }
}
