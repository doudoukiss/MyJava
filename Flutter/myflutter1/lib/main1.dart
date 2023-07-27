import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Seattle Supersonics")),
      body: const Center(
          child: Text(
            "Ray Allen",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 40.0,
              color: Color.fromRGBO(212,233,121,0.5),
            ),
    ),
      ),
    ),
  ));
}