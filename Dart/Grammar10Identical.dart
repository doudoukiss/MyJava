void main() {
  const a = [2];
  const b = [2];
  print(identical(a, b));

  const c = [2];
  const d = [3];
  print(identical(c, d));
}

class Container {
  int width;
  int height;
  Container({required this.width, required this.height});
}

void main() {
  var c1 = new Container(width: 100, height: 100);

  var c2 = new Container(width: 100, height: 100);

  print(identical(c1, c2));
}

class Container {
  final int width;
  final int height;
  const Container({required this.width, required this.height});
}

void main() {
  var c1 = Container(width: 100, height: 100);
  var c2 = Container(width: 100, height: 100);
  print(identical(c1, c2)); //false

  var c3 = const Container(width: 100, height: 100);
  var c4 = const Container(width: 100, height: 100);
  print(identical(c3, c4));

  var c5 = const Container(width: 100, height: 110);
  var c6 = const Container(width: 120, height: 100);
  print(identical(c5, c6));
}
