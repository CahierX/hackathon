import 'package:flutter/material.dart';
import 'package:hackathon/provider/modules/settings.dart';
import 'package:provider/provider.dart';

/// @author: chenxiaoxi
/// @date: 2022/1/26
/// @description：sidebar.dart
class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _SideBarState extends State<SideBar> {
  int isHover = -1;
  int isActive = 0;
  List menuList = [
    {"label": "控制台", "icon": Icons.grid_view_rounded},
    {"label": "消息", "icon": Icons.message_rounded},
    {"label": "设置", "icon": Icons.settings_rounded},
  ];
  Object _selection = "";

  void _setHoverNumber(val) {
    setState(() {
      isHover = val;
    });
  }

  void _toNavigateFunc(index) {
    context.read<SettingsProvider>().setTabIndexFunc(index);
    setState(() {
      isActive = index;
    });
    // Future.microtask(() => context.read<SettingsProvider>().setTabIndexFunc(index)); // 异步
    // switch (index) {
    //   case 0:
    //     Provider.of<SettingsProvider>(context).setTabIndexFunc(index);
    //     break;
    //   case 1:
    //     break;
    //   case 2:
    //     break;
    // }
  }

  List<Widget> _listView() {
    return menuList
        .asMap()
        .map((index, str) => MapEntry(
              index,
              MouseRegion(
                onEnter: (e) {
                  _setHoverNumber(index);
                },
                onExit: (e) {
                  setState(() {
                    isHover = -1;
                  });
                },
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    _toNavigateFunc(index);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isHover == index || isActive == index
                          ? const Color.fromRGBO(255, 255, 255, 0.1)
                          : Colors.transparent,
                    ),
                    child: Tooltip(
                      message: str["label"],
                      child: Icon(
                        str["icon"],
                        color: isHover == index || isActive == index
                            ? Colors.white
                            : Colors.white38,
                      ),
                    ),
                  ),
                ),
              ),
            ))
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Positioned(
          top: 20.0,
          child: Tooltip(
            message: "个人头像",
            child: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: const MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: CircleAvatar(
                    backgroundColor: Colors.white38,
                    child: Text('AH'),
                  ),
                )),
          ),
        ),
        Positioned(
          top: 70.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _listView(),
          ),
        ),
        Positioned(
            bottom: 20.0,
            child: PopupMenuButton<WhyFarther>(
              child: const Tooltip(
                message: "其他",
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Icon(
                    Icons.reorder_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              onSelected: (WhyFarther result) {
                setState(() {
                  _selection = result;
                  print(result);
                });
              },
              offset: const Offset(42, 0),
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<WhyFarther>>[
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.harder,
                  child: Text('Working a lot harder'),
                ),
              ],
            ))
      ],
    );
  }
}
