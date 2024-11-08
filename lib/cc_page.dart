import 'package:complycube/complycube_widget.dart';
import 'package:complycube/helpers/complycube_error_codes.dart';
import 'package:complycube/helpers/complycube_event_codes.dart';
import 'package:flutter/material.dart';

class CCPage extends StatefulWidget {
  const CCPage({super.key});

  @override
  State<CCPage> createState() => _CCPageState();
}

class _CCPageState extends State<CCPage> {
  bool showCCModal = false;

  final settings = {
    "clientID": "672de487a0ab4c00083fd60a",
    "clientToken":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjoiWlRFNU9HRmpZelUzTWpSaU4yUTNOREF6WVdVMU5XWXdOemt3WkdVeU5HUXlNekJpWlRjM05ESXdNMkUzTXpRMk5ETXlNakUwWVRJMk5URTFOemsxTUdGak16RmxZamMzWVRjd01tTm1ZV0ZqTURjMk5UVTNNV0ZtT1RGaU1URTNOak5tTm1FNE5EaGpPV0ptWkdZNE9ETXhOelkxWmpWak16Y3hZamN4TlRjeE16SXhaVFkwWXpkbU9UYzFNemxoT0RVNU5XSXhOakV4T0RZMU9EQTNNVGsxWkdOa09Ua3hZalk0WkdSbE9HUmtORE00TVdFeVpUUmtZVEUxWkdRM09UZzJObVEzT1RoaE1EZGtaREU0TkRZeU5UaGtNemsxWlRVMllUQXhaVFkxTTJFNVlURTBNR0psT0RBeU1XWXlOelpoWkRNMlpHTm1OalJpT0RkbU5EZG1abUkzTXpNd05qWmpPV1U0TXpJNE1tVmxNekV6WldGa01XSmhNVFkzIiwidXJscyI6eyJhcGkiOiJodHRwczovL2FwaS5jb21wbHljdWJlLmNvbSIsInN5bmMiOiJ3c3M6Ly94ZHMuY29tcGx5Y3ViZS5jb20iLCJjcm9zc0RldmljZSI6Imh0dHBzOi8veGQuY29tcGx5Y3ViZS5jb20ifSwib3B0aW9ucyI6eyJoaWRlQ29tcGx5Q3ViZUxvZ28iOmZhbHNlLCJlbmFibGVDdXN0b21Mb2dvIjp0cnVlLCJlbmFibGVUZXh0QnJhbmQiOnRydWUsImVuYWJsZUN1c3RvbUNhbGxiYWNrcyI6dHJ1ZSwiZW5hYmxlTmZjIjpmYWxzZSwiaWRlbnRpdHlDaGVja0xpdmVuZXNzQXR0ZW1wdHMiOjUsImRvY3VtZW50SW5mbGlnaHRUZXN0QXR0ZW1wdHMiOjIsIm5mY1JlYWRBdHRlbXB0cyI6NSwiZW5hYmxlQWRkcmVzc0F1dG9jb21wbGV0ZSI6dHJ1ZSwiZW5hYmxlV2hpdGVMYWJlbGluZyI6dHJ1ZX0sImlhdCI6MTczMTA2MTgzNSwiZXhwIjoxNzMxMDY1NDM1fQ.ElWkt3IuHLkds2ANOPaCZ0P60gEFdTXvIsowxGWyvs0",
    "stages": [
      {
        "name": 'intro',
        "heading": 'Green Bank ID verification',
      },
      {
        "name": 'documentCapture',
        "showGuidance": true,
        "useMLAssistance": true,
        "liveCapture": false,
        "retryLimit": 1,
        "documentTypes": {
          "passport": true,
          "driving_license": ['GB', 'FR'],
        },
      },
      'faceCapture',
    ],
    // ...
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showCCModal ? ComplyCubeWidget(
        settings: settings,
        onError: (errors) {
          print('Error received');
          print(errors.first.message);
          // errors.map((e) => print("Error from cc: ${e.message}"));
        },
        onComplyCubeEvent: (event) => print(event.name),
        onCancelled: (error) {
          if (error.complyCubeErrorCode == ComplyCubeErrorCode.Cancelled) {
            print('handle closure');
            setState(() {
               showCCModal = false;
            });
           
          } else {
            print(error.message);
            print(error.complyCubeErrorCode);
          }
        },
      ) : 
      Center(
        child: GestureDetector(
          onTap: () => setState(() {
            showCCModal = true;
          }),
          child: Text('show cc modal'),
        ),
      ),
    );
  }
}
