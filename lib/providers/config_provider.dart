import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _stages = [
    {
      "name": 'intro',
      "title": 'Test Bank ID verification',
      "enabled": true, // Add an `enabled` flag for toggling
    },
    {
      "name": "consent",
      "title": "Custom Consent Screen Title",
      "enabled": true,
    },
    {
      "name": 'documentCapture',
      "showGuidance": true,
      "useMLAssistance": false,
      "liveCapture": false,
      "retryLimit": 2,
      "documentTypes": {
        "passport": true,
        "driving_license": true,
        "national_identity_card": true,
        "residence_permit": true
      },
      "enabled": true,
    },
    {
      "name": "faceCapture",
      "mode": "photo",
      "useMLAssistance": false,
      "enabled": true,
    },
    {
      "name": "poaCapture",
      "liveCapture": false,
      "enabled": true,
    },
    // If below is enabled then sdk does not load
    // {
    //   "name": "complete",
    //   "heading": "Thank you!",
    //   "message": "Your KYC submission has been completed.",
    //   "enabled": true,
    // },
  ];

  List<Map<String, dynamic>> get stages => _stages;

  void toggleStage(String stageName) {
    final stage = _stages.firstWhere((stage) => stage['name'] == stageName);
    stage['enabled'] = !(stage['enabled'] ?? true);
    notifyListeners();
  }

  Map<String, dynamic> getSettings(String clientId, String token) {
    return {
      "clientID": "<id>",
      "clientToken": "<token>",
      "stages":
          _stages.where((stage) => stage['enabled'] as bool? ?? true).toList(),
    };
  }
}
