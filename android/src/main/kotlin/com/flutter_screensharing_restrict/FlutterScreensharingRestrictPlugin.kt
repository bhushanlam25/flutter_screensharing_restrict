package com.flutter_screensharing_restrict

import android.content.pm.PackageManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** FlutterScreensharingRestrictPlugin */
class FlutterScreensharingRestrictPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var bindings : FlutterPlugin.FlutterPluginBinding

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    bindings=flutterPluginBinding
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.example.myapp/screen_share")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "checkScreenSharingApps") {
      val screenSharingApps = listOf(
        "us.zoom.videomeetings", // Zoom
        "com.google.android.apps.meetings", // Google Meet
        "com.skype.raider", // Skype
        "org.telegram.messenger", // Telegram
        "com.koushikdutta.vysor"
        // Add other known screen-sharing apps here
      )
      val installedApps = bindings.applicationContext.packageManager.getInstalledPackages(PackageManager.GET_META_DATA)
      val foundApps = installedApps.map { it.packageName }.filter { screenSharingApps.contains(it) }

      if (foundApps.isNotEmpty()) {
        result.success(true) // Found screen-sharing apps
      } else {
        result.success(false) // No screen-sharing apps found
      }
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
