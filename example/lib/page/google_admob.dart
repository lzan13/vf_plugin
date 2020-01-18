// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';
import 'package:vf_plugin_example/page/ads/ads_manager.dart';

///
/// 测试加载 Google Admob 广告
///
class AdmobPage extends StatefulWidget {
  @override
  AdmobPageState createState() => AdmobPageState();
}

class AdmobPageState extends State<AdmobPage> {
  int mGold = 0;
  @override
  void initState() {
    super.initState();
    // 初始化 ADS
    ADSManager.instance.initADS();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VFTopBar(
        top: MediaQuery.of(context).padding.top,
        title: "测试 Google Admob",
        titleColor: VFColors.white,
        leftIcon: Icons.arrow_back,
      ),
      body: ListView(
        children: <Widget>[
          VFListItem(
            isNewGroup: true,
            showDivider: false,
            title: '你当前拥有 $mGold V币',
          ),
          VFListItem(
            isNewGroup: true,
            title: '显示横幅广告',
            onPressed: () {
              ADSManager.instance.showBannerADS();
            },
          ),
          VFListItem(
            title: '移除横幅广告',
            onPressed: () {
              ADSManager.instance.hideBannerADS();
            },
          ),
          VFListItem(
            title: '显示插屏广告',
            onPressed: () {
              ADSManager.instance.showInterstitialADS();
            },
          ),
          VFListItem(
            title: '显示奖励视频广告',
            onPressed: () {
              ADSManager.instance.showVideoADS();
            },
          ),
        ],
      ),
    );
  }
}
