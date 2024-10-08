import 'package:flutter/services.dart';
import 'package:flutter_screensharing_restrict/method_channel_flutter_screensharing_restrict.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterScreensharingRestrict platform = MethodChannelFlutterScreensharingRestrict();
  const MethodChannel channel = MethodChannel('untitled');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
