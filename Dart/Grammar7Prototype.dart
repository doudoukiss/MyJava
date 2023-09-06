getData<T>(T value) {
  return value;
}

void main() {
  print(getData<int>(12));
}

class MyList<T> {
  List list = <T>[];
  void add(T value) {
    this.list.add(value);
  }

  List getList() {
    return list;
  }
}

main() {
  List list2 = new List<int>.filled(2, 0);
  list2[0] = 12;
  list2[1] = 13;
  print(list2);
}

abstract class Cache<T> {
  getByKey(String key);
  void setByKey(String key, T value);
}

class FileCache<T> implements Cache<T> {
  @override
  getByKey(String key) {
    return null;
  }

  @override
  void setByKey(String key, T value) {
    print("我是文件缓存 把key=${key}  value=${value}的数据写入到了文件中");
  }
}

class MemoryCache<T> implements Cache<T> {
  @override
  getByKey(String key) {
    return null;
  }

  @override
  void setByKey(String key, T value) {
    print("我是内存缓存 把key=${key}  value=${value} -写入到了内存中");
  }
}

void main() {
  MemoryCache m = new MemoryCache<Map>();
  m.setByKey('index', {"name": "张三", "age": 20});
}
