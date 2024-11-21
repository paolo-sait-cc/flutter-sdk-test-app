import 'package:complycube/complycube.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/config_provider.dart';

class NewCCPage extends StatefulWidget {
  const NewCCPage({super.key});

  @override
  State<NewCCPage> createState() => _NewCCPageState();
}

class _NewCCPageState extends State<NewCCPage> {
  onTap() async {
    final result = await Complycube.openCCubeNativeBuild(
      settings: Provider.of<SettingsProvider>(context).getSettings('', ''),
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Style'),
      ),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: onTap,
            child: const Text('show cc modal'),
          ),
        ),
      ),
    );
  }
}
