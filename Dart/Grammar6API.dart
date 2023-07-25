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
  Mysql mysql = new Mysql('xxxxxx');

  mysql.add('1243214');
}

import 'lib/MsSql.dart';

main() {
  MsSql mssql=new MsSql();
  mssql.uri='127.0.0.1';
  mssql.add('增加的数据'); 
}

abstract class A{
  late String name;
  printA();
}

abstract class B{
  printB();
}

class C implements A,B{  
  @override
  late String name;  
  @override
  printA() {
    print('printA');
  }
  @override
  printB() {
    return null;
  }  
}

void main(){
  C c=new C();
  c.printA();
}

class A {
  String info="this is A";
  void printA(){
    print("A");
  }
}

class B {
  void printB(){
    print("B");
  }
}

class C with A,B{
  
}

void main(){
  
  var c=new C();  
  c.printA();
  c.printB();
  print(c.info);


}

class Person{
  String name;
  num age;
  Person(this.name,this.age);
  printInfo(){
    print('${this.name}----${this.age}');
  }
  void run(){
    print("Person Run");
  }
}

class A {
  String info="this is A";
  void printA(){
    print("A");
  }
  void run(){
    print("A Run");
  }
}

class B {  
  void printB(){
    print("B");
  }
  void run(){
    print("B Run");
  }
}

class C extends Person with B,A{
  C(String name, num age) : super(name, age);
  
}

void main(){  
  var c=new C('张三',20);  
  c.printInfo();
  c.run();
}

class A {
  String info="this is A";
  void printA(){
    print("A");
  }
}

class B {
  void printB(){
    print("B");
  }
}

class C with A,B{
  
}

void main(){  
   var c=new C();  
   
  print(c is C);  
  print(c is A);    
  print(c is B);   
}
