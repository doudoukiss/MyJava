import 'package:flutter/material.dart';
import '../pages/tabs.dart';
import '../pages/search.dart';
import '../pages/news.dart';
import '../pages/form.dart';
import '../pages/shop.dart';

Map routes = {
  "/": (contxt) => const Tabs(),
  "/news": (contxt) => const NewsPage(),
  "/search": (contxt) => const SearchPage(),
  "/form": (contxt, {arguments}) => FormPage(arguments: arguments),
  "/shop": (contxt, {arguments}) => ShopPage(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
