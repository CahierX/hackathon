import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/main.dart';
import 'package:hackathon/utils/http/http.dart';
import 'package:hackathon/utils/platform/index.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/26
/// @description：m_home.dart
class PoetryList extends StatefulWidget {
  const PoetryList({Key? key}) : super(key: key);

  @override
  _PoetryList createState() => _PoetryList();
}

class _PoetryList extends State<PoetryList> {
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
    // var data = fetchData();
    // debugPrint(data.toString());
    movieList = [
      {'title': '第一首诗'},
      {'title': '第二首诗'}
    ];
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
        movieList.addAll([
          {'title': '第三首诗'},
          {'title': '第四首诗'}
        ]);
      });
    }
  }

  Future<void> onRefresh() async {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        movieList = [
          {'title': '第一首诗'},
          {'title': '第二首诗'}
        ];
      });
    });
  }

  Widget buildGrid() {
    List<Widget> list = [];
    Widget content;
    for (var item in movieList) {
      content = Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                item['title'],
                softWrap: false,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
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
        crossAxisCount: 1,
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
