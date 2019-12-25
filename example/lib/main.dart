import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';

import 'demo_page.dart';

void main() async {
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildThemeData(),
      home: DemoPage(),
    );
  }

  /// 构建主题
  ThemeData _buildThemeData() {
    return ThemeData(
      // pageTransitionsTheme: PageTransitionsTheme(builders: {
      //   // Android 使用 iOS 的页面动画
      //   TargetPlatform.android: const _CustomAndroidTransitionsBuilder(),
      //   TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
      // }),
      appBarTheme: AppBarTheme(
        color: VFColors.red,
        elevation: 0,
      ),
      // primarySwatch: Colors.grey,
      primaryColorBrightness: Brightness.dark,
      primaryColor: VFColors.red,
      primaryColorDark: VFColors.redDark,
      accentColor: VFColors.green,
      dividerColor: VFColors.grey12,

      /// 因为 iOS 上字体有时候会出现奇怪的问题
      /// [github issues](https://github.com/flutter/flutter/issues/26752)
      /// 这里需要手动指定字体
      fontFamily: "PingFang SC",
    );
  }
}

/// 自定义 Android 界面切换动画
class _CustomAndroidTransitionsBuilder extends PageTransitionsBuilder {
  const _CustomAndroidTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return new CupertinoPageTransition(
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      linearTransition: false,
      child: child,
    );
  }
}
