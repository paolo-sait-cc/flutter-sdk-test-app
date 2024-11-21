import 'package:complycube/complycube.dart';
import 'package:complycube/complycube_widget.dart';
import 'package:complycube/helpers/complycube_error_codes.dart';
// import 'package:complycube/helpers/complycube_event_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sdk_test_app/main.dart';
import 'package:flutter_sdk_test_app/providers/config_provider.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_sdk_test_app/providers/config_provider.dart';

class CCPage extends StatefulWidget {
  const CCPage({
    super.key,
    required this.clientId,
    required this.token,
  });

  final String clientId;
  final String token;

  @override
  State<CCPage> createState() => _CCPageState();
}

class _CCPageState extends State<CCPage> {
  bool showCCModal = false;

  Future<void> onTap() async {
    setState(() {
      showCCModal = !showCCModal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Old Style'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                onTap: onTap,
                child: const Text('show cc modal'),
              ),
            ),
            if (showCCModal)
              ComplyCubeWidget(
                settings: Provider.of<SettingsProvider>(context)
                    .getSettings(widget.clientId, widget.token),
                onSuccess: (result) {
                  print(result);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainApp()),
                  );
                },
                onError: (errors) {
                  print('Error received');
                  print(errors.first.message);
                  // setState(() {
                  //   print('toggle');
                  //   showCCModal = false;
                  // });
                  // errors.map((e) => print("Error from cc: ${e.message}"));
                },
                onComplyCubeEvent: (event) {},
                onCancelled: (error) {
                  if (error.complyCubeErrorCode ==
                      ComplyCubeErrorCode.Cancelled) {
                    print('handle closure');
                  } else {
                    print(error.message);
                    print(error.complyCubeErrorCode);
                  }
                  setState(() {
                    print('toggle');
                    showCCModal = false;
                  });
                },
              )
          ],
        ),
      ),
    );
  }
}
