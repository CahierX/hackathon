import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 2.0 / 1.5,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                            child: Image.asset(
                              'assets/icon/logo.png',
                              fit: BoxFit.cover,
                              height: 10,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'inginginginginginginginginginginginginginging.',
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
                            'inginginginginginginginging',
                            softWrap: true,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 14.0),
                          ),
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2.0 / 1.5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6)),
                          child: Image.asset(
                            'assets/icon/logo.png',
                            fit: BoxFit.cover,
                            height: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'inginginginginginginginginginginginginginging.',
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
                          'inginginginginginginginging',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverFixedExtentList(
              itemExtent: 100.0,
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text("加载更多"),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0))),
                    ),
                  ),
                );
              }, childCount: 1)),
        ],
      ),
    );
  }
}
