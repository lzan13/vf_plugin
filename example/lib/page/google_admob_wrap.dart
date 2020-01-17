// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:vf_plugin/vf_plugin.dart';
import 'package:vf_plugin_example/admob/ads.dart';

/// Made a high-level variable to be accessible to ads_test.dart
Ads ads;

class AdmobWrapPage extends StatefulWidget {
  @override
  AdmobWrapPageState createState() => AdmobWrapPageState(initOption: 1);
}

class AdmobWrapPageState extends State<AdmobWrapPage> {
  final int initOption;
  int _coins = 0;

  AdmobWrapPageState({this.initOption = 1});

  final String appId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544~3347511713'
      : 'ca-app-pub-3940256099942544~1458002511';
  final String bannerUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';
  final String screenUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';
  final String videoUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5224354917'
      : 'ca-app-pub-3940256099942544/1712485313';

  @override
  void initState() {
    super.initState();

    switch (initOption) {
      case 1:

        /// Assign a listener.
        var eventListener = (MobileAdEvent event) {
          VFLog.d("The opened ad is clicked on.");
          if (event == MobileAdEvent.clicked) {}
        };

        ads = Ads(
          appId,
          bannerUnitId: bannerUnitId,
          screenUnitId: screenUnitId,
          videoUnitId: videoUnitId,
          keywords: <String>['ibm', 'computers'],
          contentUrl: 'http://www.ibm.com',
          childDirected: false,
          testDevices: ['Samsung_Galaxy_SII_API_26:5554'],
          testing: false,
          listener: eventListener,
        );

        break;

      case 2:
        ads = Ads(appId);

        /// Assign the listener.
        var eventListener = (MobileAdEvent event) {
          VFLog.d("User has opened and now closed the ad.");
          if (event == MobileAdEvent.closed) {}
        };

        /// You can set the Banner, Fullscreen and Video Ads separately.

        ads.setBannerAd(
          adUnitId: bannerUnitId,
          size: AdSize.banner,
          keywords: ['andriod, flutter'],
          contentUrl: 'http://www.andrioussolutions.com',
          childDirected: false,
          testDevices: ['Samsung_Galaxy_SII_API_26:5554'],
          listener: eventListener,
        );

        ads.setFullScreenAd(
            adUnitId: screenUnitId,
            keywords: ['dart', 'flutter'],
            contentUrl: 'http://www.fluttertogo.com',
            childDirected: false,
            testDevices: ['Samsung_Galaxy_SII_API_26:5554'],
            listener: (MobileAdEvent event) {
              if (event == MobileAdEvent.opened) {
                VFLog.d("An ad has opened up.");
              }
            });

        var videoListener = (RewardedVideoAdEvent event,
            {String rewardType, int rewardAmount}) {
          VFLog.d("The video ad has been rewarded.");
          if (event == RewardedVideoAdEvent.rewarded) {}
        };

        ads.setVideoAd(
          adUnitId: videoUnitId,
          keywords: ['dart', 'java'],
          contentUrl: 'http://www.publang.org',
          childDirected: true,
          testDevices: null,
          listener: videoListener,
        );

        break;

      case 3:
        ads = Ads(appId);

        /// Assign the listener.
        var eventListener = (MobileAdEvent event) {
          VFLog.d("User has opened and now closed the ad.");
          if (event == MobileAdEvent.closed) {}
        };

        /// You just show the Banner, Fullscreen and Video Ads separately.

        ads.showBannerAd(
          adUnitId: bannerUnitId,
          size: AdSize.banner,
          keywords: ['andriod, flutter'],
          contentUrl: 'http://www.andrioussolutions.com',
          childDirected: false,
          testDevices: ['Samsung_Galaxy_SII_API_26:5554'],
          listener: eventListener,
        );

        ads.showFullScreenAd(
            adUnitId: screenUnitId,
            keywords: ['dart', 'flutter'],
            contentUrl: 'http://www.fluttertogo.com',
            childDirected: false,
            testDevices: ['Samsung_Galaxy_SII_API_26:5554'],
            listener: (MobileAdEvent event) {
              VFLog.d("An ad has opened up.");
              if (event == MobileAdEvent.opened) {}
            });

        var videoListener = (RewardedVideoAdEvent event,
            {String rewardType, int rewardAmount}) {
          VFLog.d("The video ad has been rewarded.");
          if (event == RewardedVideoAdEvent.rewarded) {}
        };

        ads.showVideoAd(
          adUnitId: videoUnitId,
          keywords: ['dart', 'java'],
          contentUrl: 'http://www.publang.org',
          childDirected: true,
          testDevices: null,
          listener: videoListener,
        );

        break;

      default:
        ads = Ads(appId, testing: true);
    }

    ads.eventListener = (MobileAdEvent event) {
      switch (event) {
        case MobileAdEvent.loaded:
          VFLog.d("An ad has loaded successfully in memory.");
          break;
        case MobileAdEvent.failedToLoad:
          VFLog.d("The ad failed to load into memory.");
          break;
        case MobileAdEvent.clicked:
          VFLog.d("The opened ad was clicked on.");
          break;
        case MobileAdEvent.impression:
          VFLog.d("The user is still looking at the ad. A new ad came up.");
          break;
        case MobileAdEvent.opened:
          VFLog.d("The Ad is now open.");
          break;
        case MobileAdEvent.leftApplication:
          VFLog.d("You've left the app after clicking the Ad.");
          break;
        case MobileAdEvent.closed:
          VFLog.d("You've closed the Ad and returned to the app.");
          break;
        default:
          VFLog.d("There's a 'new' MobileAdEvent?!");
      }
    };

    MobileAdListener eventHandler = (MobileAdEvent event) {
      VFLog.d("This is an event handler.");
    };

    ads.bannerListener = (MobileAdEvent event) {
      switch (event) {
        case MobileAdEvent.loaded:
          VFLog.d("An ad has loaded successfully in memory.");
          break;
        case MobileAdEvent.failedToLoad:
          VFLog.d("The ad failed to load into memory.");
          break;
        case MobileAdEvent.clicked:
          VFLog.d("The opened ad was clicked on.");
          break;
        case MobileAdEvent.impression:
          VFLog.d("The user is still looking at the ad. A new ad came up.");
          break;
        case MobileAdEvent.opened:
          VFLog.d("The Ad is now open.");
          break;
        case MobileAdEvent.leftApplication:
          VFLog.d("You've left the app after clicking the Ad.");
          break;
        case MobileAdEvent.closed:
          VFLog.d("You've closed the Ad and returned to the app.");
          break;
        default:
          VFLog.d("There's a 'new' MobileAdEvent?!");
      }
    };

    ads.removeBanner(eventHandler);

    ads.removeEvent(eventHandler);

    ads.removeScreen(eventHandler);

    ads.screenListener = (MobileAdEvent event) {
      switch (event) {
        case MobileAdEvent.loaded:
          VFLog.d("An ad has loaded successfully in memory.");
          break;
        case MobileAdEvent.failedToLoad:
          VFLog.d("The ad failed to load into memory.");
          break;
        case MobileAdEvent.clicked:
          VFLog.d("The opened ad was clicked on.");
          break;
        case MobileAdEvent.impression:
          VFLog.d("The user is still looking at the ad. A new ad came up.");
          break;
        case MobileAdEvent.opened:
          VFLog.d("The Ad is now open.");
          break;
        case MobileAdEvent.leftApplication:
          VFLog.d("You've left the app after clicking the Ad.");
          break;
        case MobileAdEvent.closed:
          VFLog.d("You've closed the Ad and returned to the app.");
          break;
        default:
          VFLog.d("There's a 'new' MobileAdEvent?!");
      }
    };

    ads.videoListener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      switch (event) {
        case RewardedVideoAdEvent.loaded:
          VFLog.d("An ad has loaded successfully in memory.");
          break;
        case RewardedVideoAdEvent.failedToLoad:
          VFLog.d("The ad failed to load into memory.");
          break;
        case RewardedVideoAdEvent.opened:
          VFLog.d("The ad is now open.");
          break;
        case RewardedVideoAdEvent.leftApplication:
          VFLog.d("You've left the app after clicking the Ad.");
          break;
        case RewardedVideoAdEvent.closed:
          VFLog.d("You've closed the Ad and returned to the app.");
          break;
        case RewardedVideoAdEvent.rewarded:
          VFLog.d("The ad has sent a reward amount.");
          break;
        case RewardedVideoAdEvent.started:
          VFLog.d("You've just started playing the Video ad.");
          break;
        case RewardedVideoAdEvent.completed:
          VFLog.d("You've just finished playing the Video ad.");
          break;
        default:
          VFLog.d("There's a 'new' RewardedVideoAdEvent?!");
      }
    };

    VoidCallback handlerFunc = () {
      VFLog.d("The opened ad was clicked on.");
    };

    ads.banner.loadedListener = () {
      VFLog.d("An ad has loaded successfully in memory.");
    };

    ads.banner.removeLoaded(handlerFunc);

    ads.banner.failedListener = () {
      VFLog.d("An ad failed to load into memory.");
    };

    ads.banner.removeFailed(handlerFunc);

    ads.banner.clickedListener = () {
      VFLog.d("The opened ad is clicked on.");
    };

    ads.banner.removeClicked(handlerFunc);

    ads.banner.impressionListener = () {
      VFLog.d("The user is still looking at the ad. A new ad came up.");
    };

    ads.banner.removeImpression(handlerFunc);

    ads.banner.openedListener = () {
      VFLog.d("You've closed an ad and returned to your app.");
    };

    ads.banner.removeOpened(handlerFunc);

    ads.banner.leftAppListener = () {
      VFLog.d("You left the app and gone to the ad's website.");
    };

    ads.banner.removeLeftApp(handlerFunc);

    ads.banner.closedListener = () {
      VFLog.d("You've closed an ad and returned to your app.");
    };

    ads.banner.removeClosed(handlerFunc);

    ads.screen.loadedListener = () {
      VFLog.d("An ad has loaded into memory.");
    };

    ads.screen.removeLoaded(handlerFunc);

    ads.screen.failedListener = () {
      VFLog.d("An ad has failed to load in memory.");
    };

    ads.screen.removeFailed(handlerFunc);

    ads.screen.clickedListener = () {
      VFLog.d("The opened ad was clicked on.");
    };

    ads.screen.removeClicked(handlerFunc);

    ads.screen.impressionListener = () {
      VFLog.d("You've clicked on a link in the open ad.");
    };

    ads.screen.removeImpression(handlerFunc);

    ads.screen.openedListener = () {
      VFLog.d("The ad has opened.");
    };

    ads.screen.removeOpened(handlerFunc);

    ads.screen.leftAppListener = () {
      VFLog.d("The user has left the app and gone to the opened ad.");
    };

    ads.screen.leftAppListener = handlerFunc;

    ads.screen.closedListener = () {
      VFLog.d("The ad has been closed. The user returns to the app.");
    };

    ads.screen.removeClosed(handlerFunc);

    ads.video.loadedListener = () {
      VFLog.d("An ad has loaded in memory.");
    };

    ads.video.removeLoaded(handlerFunc);

    ads.video.failedListener = () {
      VFLog.d("An ad has failed to load in memory.");
    };

    ads.video.removeFailed(handlerFunc);

    ads.video.clickedListener = () {
      VFLog.d("An ad has been clicked on.");
    };

    ads.video.removeClicked(handlerFunc);

    ads.video.openedListener = () {
      VFLog.d("An ad has been opened.");
    };

    ads.video.removeOpened(handlerFunc);

    ads.video.leftAppListener = () {
      VFLog.d("You've left the app to view the video.");
    };

    ads.video.leftAppListener = handlerFunc;

    ads.video.closedListener = () {
      VFLog.d("The video has been closed.");
    };

    ads.video.removeClosed(handlerFunc);

    ads.video.rewardedListener = (String rewardType, int rewardAmount) {
      VFLog.d("The ad was sent a reward amount.");
      setState(() {
        _coins += rewardAmount;
      });
    };

    RewardListener rewardHandler = (String rewardType, int rewardAmount) {
      VFLog.d("This is the Rewarded Video handler");
    };

    ads.video.removeRewarded(rewardHandler);

    ads.video.startedListener = () {
      VFLog.d("You've just started playing the Video ad.");
    };

    ads.video.removeStarted(handlerFunc);

    ads.video.completedListener = () {
      VFLog.d("You've just finished playing the Video ad.");
    };

    ads.video.removeCompleted(handlerFunc);

    // Uncomment and run this example
//    List<String> one = ads.keywords;
//
//    String two = ads.contentUrl;
//
//    bool three = ads.childDirected;
//
//    List<String> four = ads.testDevices;
//
//    bool five = ads.initialized;
  }

  @override
  void dispose() {
    ads?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VFTopBar(
        top: MediaQuery.of(context).padding.top,
        title: "封装 Google Admob",
        titleColor: VFColors.white,
        leftIcon: Icons.arrow_back,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                  key: ValueKey<String>('SHOW BANNER'),
                  child: const Text('显示 Banner 广告'),
                  onPressed: () {
                    ads.showBannerAd(state: this, anchorOffset: null);
                  }),
              RaisedButton(
                  key: ValueKey<String>('REMOVE BANNER'),
                  child: const Text('移除 Banner 广告'),
                  onPressed: () {
                    ads.closeBannerAd();
                  }),
              RaisedButton(
                key: ValueKey<String>('SHOW INTERSTITIAL'),
                child: const Text('显示插屏广告'),
                onPressed: () {
                  ads.showFullScreenAd(state: this);
                },
              ),
              RaisedButton(
                key: ValueKey<String>('SHOW REWARDED VIDEO'),
                child: const Text('显示奖励视频广告'),
                onPressed: () {
                  ads.showVideoAd(state: this);
                },
              ),
              Text(
                "你有 $_coins 积分",
                key: ValueKey<String>('COINS'),
              ),
            ].map((Widget button) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: button,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
