import 'package:flutter/cupertino.dart';
import '../pages/tabs.dart';
import '../pages/dialog.dart';
import '../pages/shop.dart';
import '../pages/pageView.dart';
import '../pages/pageViewBuilder.dart';
import '../pages/pageViewFullPage.dart';
import '../pages/pageViewSwiper.dart';

Map routes = {
  "/": (contxt) => const Tabs(),
  "/dialog": (contxt) => const DialogPage(),
  "/pageView": (contxt) => const PageViewPage(),
  "/pageViewBuilder": (contxt) => const PageViewBuilderPage(),
  "/pageViewFullPage": (contxt) => const PageViewFullPage(),
  "/pageViewSwiper": (contxt) => const PageViewSwiper(),
  "/shop": (contxt, {arguments}) => ShopPage(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder =
      routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));

      return route;
    }
  }
  return null;
};
