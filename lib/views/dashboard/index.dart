import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hackathon/provider/modules/settings.dart';
import 'package:hackathon/views/chat/index.dart';
import 'package:hackathon/views/movies/index.dart';
import 'package:hackathon/views/setting/index.dart';
import 'package:hackathon/widget/sidebar.dart';
import 'package:provider/provider.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/25
/// @description：index.dart
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

List _listComponent = [
  const Movies(),
  Setting(),
  const Chat(),
];

class _DashboardState extends State<Dashboard> {
  int _tabIndex = 0;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabIndex = context.watch<SettingsProvider>().tabIndex;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
        actions: [Container()],
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black54,
      ),
      body: Row(
        children: [
          Container(
            width: 60.0,
            height: double.infinity,
            color: Colors.black54,
            child: const SideBar(),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: _listComponent[_tabIndex],
            ),
          ),
        ],
      ),
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        color: Colors.white,
        child: Drawer(
          child: Stack(
            children: [
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: Text(
                      '评分' + '8.5',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 24,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("剧情介绍:",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54)),
                        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      ),
                      Container(
                        child: Text(
                            "该剧改编自祈祷君的同名小说，讲述了游戏架构师肖鹤云（白敬亭饰）和在校大学生"
                            "李诗情（赵今麦饰）在遭遇公交车爆炸后“死而复生”，于公交车出事的时间段内不断"
                            "经历时间循环，从下车自救到打破隔阂并肩作战，努力阻止爆炸、寻找真相的故事。",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 1.0,
                                height: 1.5)),
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                    child: Divider(
                      height: 1,
                      color: Colors.black12,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("演员列表:",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54)),
                        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      ),
                      Container(
                        child: Text("白敬亭",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 1.0,
                                height: 1.5)),
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                    child: Divider(
                      height: 1,
                      color: Colors.black12,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("剧情介绍:",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54)),
                        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      ),
                      Container(
                        child: Text(
                            "该剧改编自祈祷君的同名小说，讲述了游戏架构师肖鹤云（白敬亭饰）和在校大学生"
                            "李诗情（赵今麦饰）在遭遇公交车爆炸后“死而复生”，于公交车出事的时间段内不断"
                            "经历时间循环，从下车自救到打破隔阂并肩作战，努力阻止爆炸、寻找真相的故事。",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 1.0,
                                height: 1.5)),
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                    child: Divider(
                      height: 1,
                      color: Colors.black12,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("剧情介绍:",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54)),
                        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      ),
                      Container(
                        child: Text(
                            "该剧改编自祈祷君的同名小说，讲述了游戏架构师肖鹤云（白敬亭饰）和在校大学生"
                            "李诗情（赵今麦饰）在遭遇公交车爆炸后“死而复生”，于公交车出事的时间段内不断"
                            "经历时间循环，从下车自救到打破隔阂并肩作战，努力阻止爆炸、寻找真相的故事。",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 1.0,
                                height: 1.5)),
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                    child: Divider(
                      height: 1,
                      color: Colors.black12,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("剧情介绍:",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54)),
                        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      ),
                      Container(
                        child: Text(
                            "该剧改编自祈祷君的同名小说，讲述了游戏架构师肖鹤云（白敬亭饰）和在校大学生"
                            "李诗情（赵今麦饰）在遭遇公交车爆炸后“死而复生”，于公交车出事的时间段内不断"
                            "经历时间循环，从下车自救到打破隔阂并肩作战，努力阻止爆炸、寻找真相的故事。",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 1.0,
                                height: 1.5)),
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                    child: Divider(
                      height: 1,
                      color: Colors.black12,
                    ),
                  ),
                  Container(
                    child: null,
                    padding: EdgeInsets.only(bottom: 100),
                  )
                ],
              ),
              Positioned(
                  bottom: 30,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    height: 50,
                    child: ElevatedButton(
                        child: Text("立即播放"),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(150, 164, 139, 1)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/play", arguments: {
                            "url":
                                "http://tiankongzy.com/index.php/vod/detail/id/61267.html"
                          });
                        }),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
