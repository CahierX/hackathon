import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'm_detail.dart';
import 'm_home.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/26
/// @description：index.dart
class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8),
      //   color: Colors.white,
      // ),
      child: ClipRect(
          child: Navigator(
              initialRoute: '/movies/home',
              onGenerateRoute: (val) {
                RoutePageBuilder builder;
                switch (val.name) {
                  case '/movies/home':
                    builder = (BuildContext nContext,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) =>
                        MovieHome(
                          subContext: nContext,
                        );
                    break;
                  case '/movies/detail':
                    builder = (BuildContext nContext,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) =>
                        const MovieDetail();
                    break;
                  default:
                    builder = (BuildContext nContext,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) =>
                        MovieHome(subContext: nContext);
                }
                return PageRouteBuilder(
                  pageBuilder: builder,
                  // transitionDuration: const Duration(milliseconds: 0),
                );
              },
              onUnknownRoute: (val) {
                print(val);
              },
              observers: <NavigatorObserver>[])),
    );
  }
}
