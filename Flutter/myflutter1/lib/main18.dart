import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
  }

  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                print("左侧的按钮图标");
              },
            ),
            backgroundColor: Colors.red,
            title: const Text("Flutter App"),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  print("搜索图标");
                },
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {
                  print("更多");
                },
              )
            ],
            bottom: TabBar(
                isScrollable: true,
                indicatorColor:Colors.white,
                indicatorWeight: 2,
                indicatorPadding:const EdgeInsets.all(5),
                labelColor: Colors.yellow,
                unselectedLabelColor:Colors.white,
                labelStyle:const TextStyle(
                    fontSize: 14
                ),
                unselectedLabelStyle: const TextStyle(
                    fontSize: 12
                ),
                indicator:  BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                ),
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text("关注"),
                  ),
                  Tab(
                    child: Text("热门"),
                  ),
                  Tab(
                    child: Text("视频"),
                  ),
                  Tab(
                    child: Text("关注"),
                  ),
                  Tab(
                    child: Text("热门"),
                  ),
                  Tab(
                    child: Text("视频"),
                  ),
                  Tab(
                    child: Text("关注"),
                  ),
                  Tab(
                    child: Text("热门"),
                  ),
                  Tab(
                    child: Text("视频"),
                  ),
                ])),
        body: TabBarView(controller: _tabController, children: [
          const Text("我是关注"),
          const Text("我是关注"),
          const Text("我是关注"),
          const Text("我是关注"),
          const Text("我是关注"),
          const Text("我是关注"),
          const Text("我是关注"),
          ListView(
            children: const [
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
            ],
          ),
          ListView(
            children: const [
              ListTile(
                title: Text("我是视频列表"),
              )
            ],
          )
        ]));
  }
}
