import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_screensharing_restrict_platform.dart';



/// An implementation of [FlutterScreensharingRestrictPlatform] that uses method channels.
class MethodChannelFlutterScreensharingRestrict extends FlutterScreensharingRestrictPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('detect_screen_sharing');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
