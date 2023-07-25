void main() {
  print("李豆豆");
  String str = "Seattle";
  print(str);

  int myNum = 23;
  print(myNum);

  const PI = 3.1415926;
  final a = new DateTime.now();
  print(a);

  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));

  String str1 = '你好';
  String str2 = 'Dart';
  print(str1 + str2);
  print(str1 + " " + str2);

  var l8 = List<String>.filled(2, "");
  l8[0] = "string";
  print(l8);

  var p = new Map();
  p["name"] = "李四";
  p["age"] = 22;
  p["work"] = ["程序员", "送外卖"];
  print(p);
  print(p["age"]);

  var str = 123;
  if (str is String) {
    print('是string类型');
  } else if (str is int) {
    print('int');
  } else {
    print('其他类型');
  }

  var strstr = '香蕉-苹果-西瓜';
  var list = strstr.split('-');
  print(list);
  print(list is List);
}
