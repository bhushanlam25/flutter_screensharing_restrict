import 'package:flutter/services.dart';


class FlutterScreensharingRestrict {
  static const platform = MethodChannel('com.example.myapp/screen_share');

  static Future<bool> hasScreenSharingApps() async {
    try {
      final bool result = await platform.invokeMethod('checkScreenSharingApps');
      return result;
    } on PlatformException catch (e) {
     // print("Failed to check for screen sharing apps: ${e.message}");
      return false;
    }
  }
}
