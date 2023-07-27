import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Seattle")),
      body: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Ray Allen",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Color.fromRGBO(244, 244, 123, 1),
              fontSize: 40)),
    );
  }
}
