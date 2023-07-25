import 'lib/Animal.dart';

main() {
  var a = new Animal('小红狗', 20);
  print(a.getName());
}

import 'dart:io';
import 'dart:convert';


void main() async{
  var result = await getDataFromZhihuAPI();
  print(result);
}


//api接口： http://news-at.zhihu.com/api/3/stories/latest
getDataFromZhihuAPI() async{
  //1、创建HttpClient对象
  var httpClient = new HttpClient();  
  //2、创建Uri对象
  var uri = new Uri.http('news-at.zhihu.com','/api/3/stories/latest');
  //3、发起请求，等待请求
  var request = await httpClient.getUrl(uri);
  //4、关闭请求，等待响应
  var response = await request.close();
  //5、解码响应的内容
  return await response.transform(utf8.decoder).join();
}


void main() async{
  var result = await testAsync();
  print(result);

}

testAsync() async{
  return 'Hello async';
}

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';

main() async {
    print(formatDate(DateTime(1989, 2, 21), [yyyy, '*', mm, '*', dd]));
}

import 'lib/myMath.dart' hide getName;

void main(){
//  getName();
  getAge();
}