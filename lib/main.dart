import 'package:flutter/material.dart';
import 'package:flutter_sdk_test_app/cc_page.dart';
import 'package:flutter_sdk_test_app/start_verification_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: CCPage(),
      ),
    );
  }
}
