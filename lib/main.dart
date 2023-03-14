import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sherpas_mobile_flutter/pages/chat_page.dart';
import 'package:sherpas_mobile_flutter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get(
        Uri.http('localhost:3333', '/auth/me'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
      builder: (BuildContext context, AsyncSnapshot<http.Response> response) {
        if (response.hasData) {
          if (response.data!.statusCode == 403) {
            return const MyHomePage(title: "Login Form");
          }
          return const ChatPage(title: "Messenger");
        } else {
          return const Text("Loading...");
        }
      },
    );
  }
}
