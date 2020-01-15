import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';

///
/// 高斯模糊界面
///
class BlurPage extends StatefulWidget {
  @override
  BlurPageState createState() => BlurPageState();
}

class BlurPageState extends State<BlurPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VFTopBar(
        top: MediaQuery.of(context).padding.top,
        title: "高斯模糊",
        titleColor: VFColors.white,
        leftIcon: Icons.arrow_back,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/img_girl.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: VFBlur(
              // blurRadius: VFDimens.d_2,
              type: VFBlurType.rect,
              child: Padding(
                padding: EdgeInsets.all(VFDimens.d_16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'BackdropFilter class',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: VFDimens.d_8),
                      child: Text(
                        'A widget that applies a filter to the existing painted content and then paints child.'
                        'The filter will be applied to all the area within its parent or ancestor widget\'s clip. If there\'s no clip, the filter will be applied to the full screen.',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: VFDimens.d_24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                VFBlur(
                  type: VFBlurType.circle,
                  child: IconButton(
                    onPressed: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) {
                      //   return BlurImagePage();
                      // }));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    iconSize: VFDimens.d_24,
                  ),
                ),
                VFBlur(
                  type: VFBlurType.circle,
                  child: Container(
                    width: VFDimens.d_48,
                    height: VFDimens.d_48,
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: VFDimens.d_24,
                    ),
                  ),
                ),
                VFBlur(
                  type: VFBlurType.circle,
                  child: Container(
                    width: VFDimens.d_48,
                    height: VFDimens.d_48,
                    child: Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: VFDimens.d_24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            child: Container(
              width: 140,
              height: 210,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 140,
                      height: 210,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(
                        'assets/images/img_girl.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        width: 140,
                        height: 210,
                        color: Colors.white10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
