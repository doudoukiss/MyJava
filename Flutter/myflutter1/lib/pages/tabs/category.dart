import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text("Ray Allen"),
        ),
        ListTile(
          title: Text("Allen Iverson"),
        ),
        ListTile(
          title: Text("Paul Pierce"),
        ),
        ListTile(
          title: Text("hihihi"),
        ),
        ListTile(
          title: Text("heiheihei"),
        ),
        ListTile(
          title: Text("hohoho"),
        ),

      ],
    );
  }
}