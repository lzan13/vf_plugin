import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vf_plugin/vf_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('vf_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {});
}
