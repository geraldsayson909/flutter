import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
            Color.fromARGB(255, 97, 9, 250), Color.fromARGB(255, 98, 47, 187)),
        // body: GradientContainer.purple(),
      ),
    ),
  );
}
