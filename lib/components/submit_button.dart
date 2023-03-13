import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        print("hello: $email $password");
        try {
          final response = await http.post(
            Uri.http('localhost:3333', '/auth/login'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(
                <String, String>{"username": email, "password": password}),
          );
          print(jsonDecode(response.body));
        } catch (e) {
          print(e);
        }
      },
      child: const Text('Login'),
    );
  }
}
