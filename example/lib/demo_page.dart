import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';
import 'package:vf_plugin_example/page/blur_page.dart';
import 'package:vf_plugin_example/page/date_page.dart';
import 'package:vf_plugin_example/page/google_admob.dart';
import 'package:vf_plugin_example/page/list_example_page.dart';
import 'package:vf_plugin_example/page/loading_page.dart';
import 'package:vf_plugin_example/page/reg_page.dart';
import 'package:vf_plugin_example/page/sliver_page.dart';
import 'package:vf_plugin_example/page/test_page.dart';
import 'package:vf_plugin_example/page/timeline_page.dart';
import 'package:vf_plugin_example/page/timer_page.dart';

class DemoPage extends StatefulWidget {
  @override
  DemoPageState createState() => DemoPageState();
}

class DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VFTopBar(
        top: MediaQuery.of(context).padding.top,
        title: "插件 Example",
        titleColor: VFColors.white,
      ),
      body: ListView(children: <Widget>[
        VFListItem(
          isNewGroup: true,
          title: 'Loading 控件',
          describe: '查看下自定义的 loading 控件',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return LoadingPage();
            }));
          },
        ),
        VFListItem(
          title: 'VFExampleItem',
          describe: '验证自定义 VFExampleItem 控件是否好用',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ExampleListPage();
            }));
          },
        ),
        VFListItem(
          title: '自定义 SliverDelegate',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return SliverPage();
            }));
          },
        ),
        VFListItem(
          title: '测试列表项内容过长的情况，内容过长的情况内容过长的情况，是否隐藏显示内容',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return TestPage();
            }));
          },
        ),
        VFListItem(
          title: '高斯模糊',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return BlurPage();
            }));
          },
        ),
        VFListItem(
          title: '测试 Google Admob',
          describe: '测试 Google Admob 横幅、插屏、视频广告',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return AdmobPage();
            }));
          },
        ),
        VFListItem(
          title: '时间日期',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DatePage();
            }));
          },
        ),
        VFListItem(
          title: '正则判断',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return RegexPage();
            }));
          },
        ),
        VFListItem(
          title: '定时器',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return TimerPage();
            }));
          },
        ),
        VFListItem(
          title: '时间显示',
          describe: '测试获取不同时间点的时间显示效果',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return TimelinePage();
            }));
          },
        ),
      ]),
    );
  }
}
