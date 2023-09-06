void printInfo() {
  print('我是一个自定义方法');
}

int getNum() {
  var myNum = 123;
  return myNum;
}

String printUserInfo() {
  return 'this is str';
}

List getList() {
  return ['111', '2222', '333'];
}

void main() {
  bool isEvenNumber(int n) {
    if (n % 2 == 0) {
      return true;
    }
    return false;
  }

//  2、定义一个方法打印1-n以内的所有偶数
  printNum(int n) {
    for (var i = 1; i <= n; i++) {
      if (isEvenNumber(i)) {
        print(i);
      }
    }
  }

  printNum(10);
}
