/// @author: chenxiaoxi
/// @date: 2022/1/25
/// @description：index.dart
import 'package:flutter/material.dart';
import 'package:hackathon/views/dashboard/index.dart';
import 'package:hackathon/views/movies/play.dart';

/// 路由关系映射表，path => Widget
Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => const Dashboard(),
  "/dashboard": (BuildContext context) => const Dashboard(),
  "/play": (BuildContext context) => const MPlay(),
};

/// 提取路由的参数 demo:Navigator.pushNamed(context, '/')
getRouteFunction() {
  return (RouteSettings settings) {
    final String? name = settings.name;
    final Function? pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
        return route;
      }
    }
  };
}

class Right2LeftRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;

  Right2LeftRouter(
      {required this.child,
      this.duration_ms = 500,
      this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: duration_ms),
            pageBuilder: (ctx, a1, a2) {
              return child;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}
