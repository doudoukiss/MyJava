import 'package:flutter/material.dart';
import '../widget/image.dart';

class PageViewSwiper extends StatefulWidget {
  const PageViewSwiper({super.key});

  @override
  State<PageViewSwiper> createState() => _PageViewSwiperState();
}

class _PageViewSwiperState extends State<PageViewSwiper> {
  List<Widget> list = [];
  int _currentIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = const [
      ImagePage(
        src: "https://www.itying.com/images/flutter/1.png",
      ),
      ImagePage(
        src: "https://www.itying.com/images/flutter/2.png",
      ),
      ImagePage(
        src: "https://www.itying.com/images/flutter/3.png",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageViewSwiper'),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              onPageChanged: (index){
                setState(() {
                  _currentIndex=index % list.length;
                });
              },
                itemCount: 1000,
                itemBuilder: (context, index) {
                  return list[index % list.length];
                }),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(list.length, (index){
                return Container(
                  margin: const EdgeInsets.all(5),
                  width: 10, height: 10,
                  decoration: BoxDecoration(
                    color: _currentIndex==index?Colors.blue:Colors.grey,
                    shape: BoxShape.circle
                  ),
                );
              }).toList(),
          ))
        ],
      ),
    );
  }
}
