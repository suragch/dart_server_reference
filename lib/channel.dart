import 'package:demo/controllers/words_controller.dart';
import 'package:demo/controllers/register_controller.dart';
import 'package:aqueduct/managed_auth.dart';
import 'package:demo/model/user.dart';
import 'controllers/logout_controller.dart';
import 'demo.dart';

class DemoChannel extends ApplicationChannel {
  ManagedContext context;
  AuthServer authServer;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = WordConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    context = ManagedContext(dataModel, persistentStore);

    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
        .route('/register')
        .link(() => RegisterController(context, authServer));

    router
        .route('/auth/token')
        .link(() => AuthController(authServer));

    router
        .route('/logout')
        .link(() => Authorizer.bearer(authServer))
        .link(() => LogoutController(context));

    router
        .route('/words/[:id]')
        .link(() => Authorizer.bearer(authServer))
        .link(() => WordsController(context));

    return router;
  }
}

class WordConfig extends Configuration {
  WordConfig(String path): super.fromFile(File(path));

  DatabaseConfiguration database;
}