import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final String email, password;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        print('hello');
      },
      child: const Text('Login'),
    );
  }
}
