import 'package:flutter/material.dart';
import 'package:vf_plugin/src/constants/vf_colors.dart';
import 'package:vf_plugin/src/constants/vf_dimens.dart';
import 'package:vf_plugin/src/widget/progress/vf_p_three_bounce.dart';

///
/// 简单封装圆形进度
///
class VFProgress extends StatelessWidget {
  // 背景颜色
  final Color bgColor;
  // 颜色
  final Color color;
  // 大小
  final double size;

  const VFProgress({
    Key key,
    this.bgColor = VFColors.transparent,
    this.color = VFColors.grey,
    this.size = VFDimens.d_24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VFPThreeBounce(
      color: VFColors.green,
      size: VFDimens.d_56,
    );
  }
}
