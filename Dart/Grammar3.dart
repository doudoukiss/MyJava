import 'lib/Person.dart';

void main(){

  Person p1=new Person.setInfo('李四1',30);
  p1.printInfo(); 

}

import 'lib/Animal.dart';

void main(){
 
 Animal a=new Animal('小狗', 3);

 print(a.getName());

 a.execRun();   
 

}


void main() {
  Map m = new Map();
  m["username"] = "张三";
  m.addAll({"age": 20});
  m.isEmpty;

  Object a = 123;
  Object v = true;
  print(a);
  print(v);
}

class Person {
  late String name;
  late int age;
  Person(this.name, this.age);
  Person.now() {
    print('我是命名构造函数');
  }
  Person.setInfo(String name, int age) {
    this.name = name;
    this.age = age;
  }
  void printInfo() {
    print("${this.name}----${this.age}");
  }
}

void main() {
  Person p1 = new Person.setInfo('李四', 30);
  p1.printInfo();
}
