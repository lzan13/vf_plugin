import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';
import 'package:vf_plugin_example/page/loading_page.dart';

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
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Loading 控件'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return LoadingPage();
              }));
            },
          ),
          ListTile(
            title: Text('Demo 选项 2'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return null;
              }));
            },
          ),
        ],
      ),
    );
  }
}
