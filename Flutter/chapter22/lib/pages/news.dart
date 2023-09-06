import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsPage extends StatefulWidget {
  final String title;
  final int aid;
  const NewsPage({super.key, this.title = "新闻", required this.aid});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.aid);
    print(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.home),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text("新闻页面"),
      ),
    );
  }
}
