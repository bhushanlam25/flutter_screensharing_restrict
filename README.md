# Flutter Screensharing Restrict

Here’s a sample `README.md` file for your Flutter plugin that restricts access if certain screen-sharing apps are installed on the device. This documentation explains how the plugin works, how to install it, and how to use it.

---

# flutter_screen_sharing

A Flutter plugin to check if specific screen-sharing apps are installed on the user's device and restrict app usage if any of these apps are found. This can help ensure that your app is not running in environments where screen-sharing apps may compromise its security.

## Features

- Detects the presence of common screen-sharing apps such as Zoom, Google Meet, Skype, Telegram, and more.
- Provides a method to restrict app functionality if any of these apps are installed.
- Supports both Android and iOS platforms.

## Installation

Add the plugin to your Flutter project's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_screen_sharing: ^0.0.1
```

Then run the following command in your terminal to fetch the plugin:

```bash
flutter pub get
```

## Usage

To use this plugin, you need to call the `isScreenSharingRestricted` method. This method will return a `bool` indicating whether any screen-sharing apps are installed on the device. If the method returns `true`, you can restrict certain functionalities in your app.

### Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screen_sharing/flutter_screen_sharing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Screen Sharing Restriction'),
        ),
        body: Center(
          child: FutureBuilder<bool>(
            future: ScreenSharingRestriction.isScreenSharingRestricted(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              return Text(
                snapshot.data == true
                    ? 'Screen sharing is restricted.'
                    : 'No screen-sharing apps detected.',
                style: TextStyle(fontSize: 20),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

### Checking for Installed Screen Sharing Apps

This plugin checks for common screen-sharing apps such as:

- Zoom (`us.zoom.videomeetings`)
- Google Meet (`com.google.android.apps.meetings`)
- Skype (`com.skype.raider`)
- Telegram (`org.telegram.messenger`)

If any of these apps are found, the `isScreenSharingRestricted()` method will return `true`.

### Android Setup

No additional setup is required for Android. The plugin checks the installed packages on the device using the Android package manager.

### iOS Setup

Ensure that the following URL schemes are added to the `ios/Runner/Info.plist` to check if these apps are installed on iOS:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>zoomus</string>
    <string>googlesmeet</string>
    <string>skype</string>
    <string>telegram</string>
</array>
```

### Methods

- `isScreenSharingRestricted()`: Returns a `Future<bool>` indicating whether any screen-sharing apps are installed on the device.

## Contributing

Feel free to contribute by submitting issues or pull requests.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.





