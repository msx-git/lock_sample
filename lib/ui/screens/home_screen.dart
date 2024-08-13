import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pin_code_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen._();

  static Route<void> route() =>
      CupertinoPageRoute(builder: (_) => const HomeScreen._());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lock Example'),
        leading: IconButton(
          onPressed: () => Navigator.push(context, SettingsScreen.route()),
          icon: const Icon(Icons.settings),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, PinCodeScreen.route());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text("UNLOCKED"),
      ),
    );
  }
}
