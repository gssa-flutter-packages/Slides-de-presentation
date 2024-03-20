import 'package:flutter_test/flutter_test.dart';
import 'package:slide_de_presentation/slide_de_presentation.dart';
import 'package:slide_de_presentation/slide_de_presentation_platform_interface.dart';
import 'package:slide_de_presentation/slide_de_presentation_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSlideDePresentationPlatform
    with MockPlatformInterfaceMixin
    implements SlideDePresentationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SlideDePresentationPlatform initialPlatform = SlideDePresentationPlatform.instance;

  test('$MethodChannelSlideDePresentation is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSlideDePresentation>());
  });

  test('getPlatformVersion', () async {
    SlideDePresentation slideDePresentationPlugin = SlideDePresentation();
    MockSlideDePresentationPlatform fakePlatform = MockSlideDePresentationPlatform();
    SlideDePresentationPlatform.instance = fakePlatform;

    expect(await slideDePresentationPlugin.getPlatformVersion(), '42');
  });
}
