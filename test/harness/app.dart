import 'package:demo/demo.dart';
import 'package:aqueduct_test/aqueduct_test.dart';

export 'package:demo/demo.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';


class Harness extends TestHarness<DemoChannel> with TestHarnessORMMixin {
  @override
  ManagedContext get context => channel.context;

  @override
  Future onSetUp() async {
    await resetData();
  }
}
