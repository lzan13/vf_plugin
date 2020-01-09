import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';

///
/// 用户信息页面
///
class SliverPage extends StatefulWidget {
  @override
  SliverPageState createState() => SliverPageState();
}

class SliverPageState extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: VFSliverDelegate(
            title: '哪吒之魔童降世哪吒之魔童降世哪吒之魔童降世哪吒之魔童降世',
            collapsedHeight: 48,
            expandedHeight: 300,
            top: MediaQuery.of(context).padding.top,
            hasAlpha: true,
            // cover:'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg',
            coverWidget: Image.network(
                'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg',
                fit: BoxFit.cover),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => VFExampleItem(),
            childCount: 50,
          ),
          itemExtent: 100,
        ),
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
