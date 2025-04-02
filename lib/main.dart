import 'package:flutter/material.dart';
import 'package:login_popup_project/screens/splash.dart';

const SAVE_KEY_NAME = 'User Loggged In';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScreenSplash(),
    );
  }
}
