import 'package:flutter/material.dart';
import 'package:task12/screens/screen_home.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenHome(),
    );
  }
}

