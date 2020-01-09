import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:vf_plugin/vf_plugin.dart';

class ExampleListPage extends StatefulWidget {
  @override
  ExampleListPageState createState() => ExampleListPageState();
}

class ExampleListPageState extends State<ExampleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VFTopBar(
        top: MediaQuery.of(context).padding.top,
        title: "测试 VFExampleItem",
        titleColor: VFColors.white,
        leftIcon: Icons.arrow_back,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: VFDimens.d_220,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return VFExampleItem(direction: Axis.horizontal);
                  },
                  itemCount: 6,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  autoplay: true,
                ),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return VFExampleItem();
            }, childCount: 100),
          ),
        ],
      ),
    );
  }
}
