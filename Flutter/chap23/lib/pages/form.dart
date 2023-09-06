import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final Map arguments;
  const FormPage({super.key, required this.arguments});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  void initState() {
    super.initState();
    print(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("表单"),
      ),
      body: const Center(
        child: Text("表单页面")
      ),
    );
  }
}