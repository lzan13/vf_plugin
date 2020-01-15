import 'package:flutter/material.dart';
import 'package:vf_plugin/src/constants/vf_dimens.dart';

import 'package:vf_plugin/src/widget/loading/vf_loading_circle.dart';
import 'package:vf_plugin/src/widget/loading/vf_loading_cube_grid.dart';
import 'package:vf_plugin/src/widget/loading/vf_loading_dobule_bounce.dart';
import 'package:vf_plugin/src/widget/loading/vf_loading_fading_circle.dart';
import 'package:vf_plugin/src/widget/loading/vf_loading_fading_cube.dart';
import 'package:vf_plugin/src/widget/loading/vf_loading_ripple.dart';
import 'package:vf_plugin/src/widget/loading/vf_loading_rotating_circle.dart';
import 'package:vf_plugin/src/widget/loading/vf_loading_rotating_square.dart';
import 'package:vf_plugin/src/widget/loading/vf_loading_three_bounce.dart';
import 'package:vf_plugin/src/widget/loading/vf_loading_wave.dart';

///
/// Create bu lzan13 2020-01-09 11:30
///
/// 简单封装圆形进度，其实就是对此项目进行了简单的包装
///
/// 这感谢 jogboms 的开源项目 https://github.com/jogboms/flutter_spinkit
///

///
/// 枚举加载类型
///
enum VFLoadingType {
  circle,
  cubeGrid,
  dobuleBounce,
  fadingCircle,
  fadingCube,
  ripple,
  rotatingCircle,
  rotatingSquare,
  threeBounce,
  wave,
}

///
/// 简单封装圆形进度
///
class VFLoading extends StatelessWidget {
  // 颜色
  Color color;
  // 大小
  final double size;
  // 线条宽度
  final double borderWidth;
// 类型
  final VFLoadingType type;

  VFLoading({
    Key key,
    this.color,
    this.size = VFDimens.d_20,
    this.borderWidth = VFDimens.d_2,
    this.type = VFLoadingType.threeBounce,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.color = color ?? Theme.of(context).accentColor;
    switch (type) {
      case VFLoadingType.circle:
        return VFLCircle(
          color: color,
          size: size,
        );
      case VFLoadingType.cubeGrid:
        return VFLCubeGrid(
          color: color,
          size: size,
        );
      case VFLoadingType.dobuleBounce:
        return VFLDoubleBounce(
          color: color,
          size: size,
        );
      case VFLoadingType.fadingCircle:
        return VFLFadingCircle(
          color: color,
          size: size,
        );
      case VFLoadingType.fadingCube:
        return VFLFadingCube(
          color: color,
          size: size,
        );
      case VFLoadingType.ripple:
        return VFLRipple(
          color: color,
          size: size,
          borderWidth: borderWidth,
        );
      case VFLoadingType.rotatingCircle:
        return VFLRotatingCircle(
          color: color,
          size: size,
        );
      case VFLoadingType.rotatingSquare:
        return VFLRotatingSquare(
          color: color,
          size: size,
        );
      case VFLoadingType.threeBounce:
        return VFLThreeBounce(
          color: color,
          size: size,
        );
      case VFLoadingType.wave:
        return VFLWave(
          color: color,
          size: size,
        );
      default:
        return VFLThreeBounce(
          color: color,
          size: size,
        );
    }
  }
}
