import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';

class LoadingPage extends StatefulWidget {
  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VFTopBar(
        top: MediaQuery.of(context).padding.top,
        title: "Loading 控件",
        titleColor: VFColors.white,
        leftIcon: Icons.arrow_back,
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: VFLoadingType.values.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return VFLoading(
            type: VFLoadingType.values[index],
          );
        },
      ),
    );
  }
}
