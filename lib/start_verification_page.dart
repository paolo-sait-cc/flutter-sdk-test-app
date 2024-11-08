import 'package:flutter/material.dart';
import 'package:flutter_sdk_test_app/cc_page.dart';

class StartVerificationPage extends StatefulWidget {
  const StartVerificationPage({super.key});

  @override
  State<StartVerificationPage> createState() => _StartVerificationPageState();
}

class _StartVerificationPageState extends State<StartVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _clientIdController = TextEditingController();
  final _clientTokenController = TextEditingController();
  bool _obscureToken = true;

  @override
  void dispose() {
    _clientIdController.dispose();
    _clientTokenController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Handle the submission
      print('Client ID: ${_clientIdController.text}');
      print('Client Token: ${_clientTokenController.text}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CCPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Credentials'),
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _clientIdController,
                  decoration: const InputDecoration(
                    labelText: 'Client ID',
                    hintText: 'Enter your client ID',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a client ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _clientTokenController,
                  decoration: InputDecoration(
                    labelText: 'Client Token',
                    hintText: 'Enter your client token',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureToken ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureToken = !_obscureToken;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureToken,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a client token';
                    }
                    if (value.length < 6) {
                      return 'Token must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
