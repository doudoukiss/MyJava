String? getData(apiUrl) {
  if (apiUrl != null) {
    return "this is server data";
  }
  return null;
}

void printLength(String? str) {
  try {
    print(str!.length);
  } catch (e) {
    print("str is null");
  }
}

abstract class Db {
  late String uri;
  add(String data);
  save();
  delete();
}

class Mysql implements Db {
  @override
  String uri;
  Mysql(this.uri);

  @override
  add(data) {
    // TODO: implement add
    print('这是mysql的add方法' + data);
  }

  @override
  delete() {
    // TODO: implement delete
    return null;
  }

  @override
  save() {
    // TODO: implement save
    return null;
  }

  remove() {}
}

class MsSql implements Db {
  @override
  late String uri;

  @override
  add(String data) {
    print('这是mssql的add方法' + data);
  }

  @override
  delete() {
    // TODO: implement delete
    return null;
  }

  @override
  save() {
    // TODO: implement save
    return null;
  }
}

main() {
  Mysql mysql = new Mysql('111111');

  mysql.add('111111');
}

String printUserInfo(String username, {int age = 10, String sex = "男"}) {
  return "姓名:$username---性别:$sex--年龄:$age";
}

String printInfo(String username, {required int age, required String sex}) {
  return "姓名:$username---性别:$sex--年龄:$age";
}

void main(args) {
  print(printUserInfo('张三'));

  print(printUserInfo('张三', age: 20, sex: "女"));

  print(printInfo('张三', age: 22, sex: "女"));
}

class Person {
  String name;
  int age;
  Person({required this.name, required this.age});

  String getName() {
    return "${this.name}---${this.age}";
  }
}

void main(args) {
  Person p = new Person(name: "张三", age: 20);
  print(p.getName());
}
