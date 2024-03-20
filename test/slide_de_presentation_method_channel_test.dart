import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slide_de_presentation/slide_de_presentation_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelSlideDePresentation platform = MethodChannelSlideDePresentation();
  const MethodChannel channel = MethodChannel('slide_de_presentation');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
