import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/main.dart';
import 'package:hackathon/utils/http/http.dart';
import 'package:hackathon/utils/platform/index.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/26
/// @description：m_home.dart
class MovieHome extends StatefulWidget {
  final BuildContext subContext;

  const MovieHome({Key? key, required this.subContext}) : super(key: key);

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  ScrollController _controller = ScrollController();
  late List movieList;
  initState() {
    super.initState();
    _controller.addListener(() {
      // 监听滚动事件，打印滚动位置
      if (_controller.position.pixels >= _controller.position.maxScrollExtent &&
          movieList.isNotEmpty) {
        onLoadMore();
      }
    });
    var data = fetchData();
    debugPrint(data.toString());
    movieList = [];
  }

  fetchData() async {
    var data = await httpGet(url: 'https://qqlykm.cn/api/yan/gc.php');
    Map<String, dynamic> responseData = jsonDecode(data);
    return responseData;
  }

  onLoadMore() {
    if (movieList.length < 100) {
      // var data = fetchData();
      setState(() {
        movieList.addAll([]);
      });
    }
  }

  Future<void> onRefresh() async {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        movieList = [];
      });
    });
  }

  Widget buildGrid() {
    List<Widget> list = [];
    Widget content;
    for (var item in movieList) {
      content = Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 2.0 / 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                child: Image.network(
                  item['vod_pic'],
                  fit: BoxFit.cover,
                  height: 10,
                ),
              ),
            ),
            Container(
              child: Text(
                item['vod_name'],
                softWrap: true,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
              padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
            ),
            Container(
              child: Text(
                item['vod_blurb'],
                softWrap: true,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 14.0),
              ),
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            )
          ],
        ),
      );
      list.add(content);
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: GridView.count(
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        crossAxisCount: isMobile() ? 2 : 4,
        childAspectRatio: 0.9,
        children: list,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: buildGrid(),
        ),
      ],
    );
  }
}
