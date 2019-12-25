import 'package:flutter/material.dart';

import 'package:vf_plugin/src/constants/vf_dimens.dart';

/// 圆形边框Icon
class CircleIcon extends StatelessWidget {
  /// 背景颜色
  final Color bgColor;

  /// 颜色
  final Color color;

  /// Icon
  final IconData icon;

  const CircleIcon({
    Key key,
    this.color = Colors.white,
    this.bgColor = Colors.orange,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Center(
        child: icon == null
            ? EmptyIcon()
            : Icon(
                icon,
                size: VFDimens.d_20,
                color: color,
              ),
      ),
    );
  }
}

/// 空图标
class EmptyIcon extends Icon {
  const EmptyIcon() : super(Icons.hourglass_empty);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
