import 'package:flutter/material.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({
    super.key,
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$email $code"),
      ),
    );
  }
}
