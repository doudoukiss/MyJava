class Person {
  static String name = '张三';
  int age = 20;
  static void show() {
    print(name);
  }

  void printInfo() {
    show();
  }

  static void printUserInfo() {
    print(name);
    show();
  }
}

main() {
  Person.printUserInfo();
}

class Person {
  late String name;
  late num age;
  Person(this.name, this.age);
  void printInfo() {
    print("${this.name}---${this.age}");
  }
}

class Web extends Person {
  Web(String name, num age) : super(name, age) {}
}

main() {
  Web w = new Web('张三', 12);
  w.printInfo();
}

class Person {
  String name;
  num age;
  Person(this.name, this.age);
  void printInfo() {
    print("${this.name}---${this.age}");
  }

  work() {
    print("${this.name}在工作...");
  }
}

class Web extends Person {
  Web(String name, num age) : super(name, age);
  run() {
    print('run');
  }

  @override
  void printInfo() {
    print("姓名：${this.name}---年龄：${this.age}");
  }

  @override
  work() {
    print("${this.name}的工作是写代码");
  }
}

main() {
  Web w = new Web('李四', 20);
  w.printInfo();
  w.work();
}
