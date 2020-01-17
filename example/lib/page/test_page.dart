import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';

///
/// 测试界面
///
class TestPage extends StatefulWidget {
  @override
  TestPageState createState() => TestPageState();
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VFTopBar(
        top: MediaQuery.of(context).padding.top,
        title: "验证下 TopBar 标题过长的情况，看看会不会显示有问题，应该够了",
        titleColor: VFColors.white,
        leftIcon: Icons.arrow_back,
      ),
      body: ListView(
        children: <Widget>[
          VFListItem(
            isNewGroup: true,
            title: '测试自定义 Item',
            describe: '查看下自定义的 VFListItem 控件',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return TestPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
