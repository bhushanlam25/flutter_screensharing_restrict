import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'MethodChannelFlutterScreensharingRestrict.dart';


abstract class FlutterScreensharingRestrictPlatform extends PlatformInterface {
  /// Constructs a DetectScreenSharingPlatform.
  FlutterScreensharingRestrictPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterScreensharingRestrictPlatform _instance = MethodChannelFlutterScreensharingRestrict();

  /// The default instance of [DetectScreenSharingPlatform] to use.
  ///
  /// Defaults to [MethodChannelUntitled].
  static FlutterScreensharingRestrictPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DetectScreenSharingPlatform] when
  /// they register themselves.
  static set instance(FlutterScreensharingRestrictPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
