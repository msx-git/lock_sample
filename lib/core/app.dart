import 'package:flutter/material.dart';

import '../ui/screens/pin_code_screen.dart';

class PinCodeBioAuth extends StatelessWidget {
  const PinCodeBioAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: const PinCodeScreen(),
    );
  }
}
