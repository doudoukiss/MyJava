import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(title: const Text("Seattle")),
        body: Column(
          children:const [
            MyApp(),
            SizedBox(height: 10,),
            Circular(),
            SizedBox(height: 10),
            ClipImage(),
            SizedBox(height: 10),
            LoaclImage()
          ],
        )
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
              color: Colors.yellow
          ),
          child: Image.network(
            "https://www.itying.com/themes/itying/images/ionic4.png",
          ),
        )
    );
  }
}

class Circular extends StatelessWidget {
  const Circular({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius:BorderRadius.circular(75),
          image:const DecorationImage(
              image:NetworkImage("https://www.itying.com/themes/itying/images/ionic4.png"),
              fit:BoxFit.cover
          )
      ),

    );
  }
}

class ClipImage extends StatelessWidget {
  const ClipImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        "https://www.itying.com/images/201906/goods_img/1120_P_1560842352183.png",
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}

class LoaclImage extends StatelessWidget {
  const LoaclImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: const BoxDecoration(
        color: Colors.yellow,
      ),
      child: Image.asset("images/a.jpeg",fit: BoxFit.cover,),
    );
  }
}
