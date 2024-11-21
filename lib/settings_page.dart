import 'package:flutter/material.dart';
import 'package:flutter_sdk_test_app/providers/config_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: settingsProvider.stages.map((stage) {
          return SwitchListTile(
            title: Text(stage['name']),
            value: stage['enabled'] ?? true,
            onChanged: (value) {
              settingsProvider.toggleStage(stage['name']);
            },
          );
        }).toList(),
      ),
    );
  }
}
