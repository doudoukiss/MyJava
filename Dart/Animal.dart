class Animal {
  late String _name; //私有属性
  late int age;
  Animal(this._name, this.age);

  void printInfo() {
    print("${this._name}----${this.age}");
  }

  String getName() {
    return this._name;
  }

  void _run() {
    print('这是一个私有方法');
  }

  execRun() {
    this._run();
  }
}
