import 'package:flutter/material.dart';
import './tabs/home.dart';
import './tabs/category.dart';
import './tabs/message.dart';
import './tabs/setting.dart';
import './tabs/user.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    CategoryPage(),
    MessagePage(),
    SettingPage(),
    UserPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter App")),
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children:  [
                Expanded(
                    flex: 1,
                    child: UserAccountsDrawerHeader(
                      accountName: const Text("itying"),
                      accountEmail: const Text("itying@qq.com"),
                      otherAccountsPictures:[
                        Image.network("https://www.itying.com/images/flutter/1.png"),
                        Image.network("https://www.itying.com/images/flutter/2.png"),
                        Image.network("https://www.itying.com/images/flutter/3.png"),
                      ],
                      currentAccountPicture:const CircleAvatar(
                          backgroundImage:NetworkImage("https://www.itying.com/images/flutter/3.png")
                      ),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://www.itying.com/images/flutter/2.png"))),
                    ))
              ],
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text("个人中心"),
            ),
            const Divider(),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("系统设置"),
            ),
            const Divider(),
          ],
        ),
      ),
      endDrawer: const Drawer(
        child: Text("右侧侧边栏"),
      ),
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          iconSize:35,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "用户")
          ]),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
            backgroundColor: _currentIndex == 2 ? Colors.red : Colors.blue,
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            }),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
    );
  }
}