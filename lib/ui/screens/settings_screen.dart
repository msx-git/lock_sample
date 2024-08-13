import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen._();

  static Route<void> route() =>
      CupertinoPageRoute(builder: (_) => const SettingsScreen._());

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _pinControllerController =
      TextEditingController();

  String get _pinCode => _pinControllerController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Pinput(
                controller: _pinControllerController,
                focusNode: _focusNode,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length != 4 ||
                      int.tryParse(value) == null) {
                    return 'Enter a valid password';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FilledButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _focusNode.unfocus();
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setInt(
                'password',
                int.parse(_pinCode),
              );

              if (!context.mounted) return;

              Navigator.of(context).pop();
            }
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.save),
              Padding(padding: EdgeInsets.all(10)),
              Text('Save'),
            ],
          ),
        ),
      ),
    );
  }
}
