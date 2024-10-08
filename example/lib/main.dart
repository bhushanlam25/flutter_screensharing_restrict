import 'package:flutter/material.dart';
import 'package:flutter_screensharing_restrict/flutter_screensharing_restrict.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasScreenSharingApps = false;

  @override
  void initState() {
    super.initState();
    _checkScreenSharingApps();
  }

  Future<void> _checkScreenSharingApps() async {
    bool result = await FlutterScreensharingRestrict.hasScreenSharingApps();
    setState(() {
      hasScreenSharingApps = result;
    });

    if (hasScreenSharingApps) {
      // Restrict access if screen-sharing apps are detected
      _showAlertDialog();
    }
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Screen Sharing Detected"),
        content: Text("Screen-sharing apps are detected on your device. Access to this app is restricted."),
        actions: [
          TextButton(
            onPressed: () {
              // Optionally, you can exit the app or navigate to another screen
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen Sharing Detection")),
      body: Center(
        child: Text(
          hasScreenSharingApps ? "Screen-sharing app detected" : "No screen-sharing app detected",
        ),
      ),
    );
  }
}
