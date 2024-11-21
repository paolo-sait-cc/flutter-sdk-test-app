import 'package:flutter/material.dart';
import 'package:flutter_sdk_test_app/start_verification_page.dart';
import 'package:provider/provider.dart';

import 'providers/config_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MainApp(),
    ),
  );
}

// void main() {
//   runApp(const MainApp());
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartVerificationPage(),
    );
  }
}
