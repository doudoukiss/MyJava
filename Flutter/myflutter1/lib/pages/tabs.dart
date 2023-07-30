import 'package:flutter/material.dart';
import './tabs/home.dart';
import './tabs/category.dart';
import './tabs/setting.dart';
import './tabs/user.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex=0;
  final List<Widget> _pages=const [
    HomePage(),
    CategoryPage(),
    SettingPage(),
    UserPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter App")),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          fixedColor:Colors.red,
          iconSize:35,
          currentIndex:_currentIndex,
          type:BottomNavigationBarType.fixed,
          onTap:(index){
            //注意
            setState(() {
              _currentIndex=index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon:Icon(Icons.home),
                label: "首页"
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.category),
                label: "分类"
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.settings),
                label: "设置"
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.people),
                label: "用户"
            )
          ]),
    );
  }
}