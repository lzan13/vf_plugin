import 'package:flutter/material.dart';

import 'package:vf_plugin/vf_plugin.dart';

///
/// 正在加载弹出框
///
class VFDialogLoading extends StatelessWidget {
  // 加载动画类型
  VFLoadingType type;
  Color color;

  VFDialogLoading({Key key, this.color, this.type = VFLoadingType.circle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SizedBox(
          height: VFDimens.d_96,
          width: VFDimens.d_96,
          child: Container(
            decoration: new BoxDecoration(
              color: VFColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(VFDimens.border_radius_normal),
              ),
              boxShadow: [
                BoxShadow(
                  color: VFColors.greyWhite54,
                  offset: Offset(0.0, 5.0),
                  blurRadius: VFDimens.d_16,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(VFDimens.d_16),
              child: VFLoading(
                color: color,
                size: VFDimens.d_20,
                type: type,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
