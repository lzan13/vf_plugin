import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';

class DemoPage extends StatefulWidget {
  @override
  DemoPageState createState() => DemoPageState();
}

class DemoPageState extends State<DemoPage> {
  /// 动态适配不同平台的 TitleBar
  dynamic buildTitleBar(BuildContext context) {
    Text titleTV = Text(
      'VFPlugin Demo',
      style: TextStyle(
        color: VFColors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
    return Platform.isIOS
        ? CupertinoNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            middle: titleTV,
          )
        : AppBar(
            title: titleTV,
            brightness: Theme.of(context).primaryColorBrightness,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTitleBar(context),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Demo 选项 1'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return null;
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
