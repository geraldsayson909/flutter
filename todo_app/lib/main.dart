import 'package:flutter/material.dart';
import 'package:todo_app/keys/keys.dart';
import 'package:todo_app/ui_updates_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Internals"),
        ),
        body: const Keys(),
      ),
    );
  }
}
