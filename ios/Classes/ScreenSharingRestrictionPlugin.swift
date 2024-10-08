import Flutter
import UIKit

public class ScreenSharingRestrictionPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "screen_sharing_restriction", binaryMessenger: registrar.messenger())
        let instance = ScreenSharingRestrictionPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "isScreenSharingRestricted":
            result(isScreenSharingRestricted())
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func isScreenSharingRestricted() -> Bool {
        let screenSharingApps = [
            "us.zoom.videomeetings", // Zoom
            "com.google.android.apps.meetings", // Google Meet
            "com.skype.raider", // Skype
            "org.telegram.messenger",
            "com.koushikdutta.vysor"// Telegram
        ]

        let application = UIApplication.shared
        for app in screenSharingApps {
            if application.canOpenURL(URL(string: "\(app)://")!) {
                return true // If any app is found, restrict screen sharing
            }
        }
        return false // No screen sharing apps found
    }
}
