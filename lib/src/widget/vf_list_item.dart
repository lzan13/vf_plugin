import 'package:flutter/material.dart';

import 'package:vf_plugin/src/constants/vf_colors.dart';
import 'package:vf_plugin/src/constants/vf_dimens.dart';

/// 自定义列表项
class VFListItem extends StatefulWidget {
  // 点击事件
  final VoidCallback onPressed;

  // 左侧图标
  final IconData leftIcon;
  final Color leftIconColor;
  // 左侧控件
  final Widget leftWidget;

  // 右侧图标
  final IconData rightIcon;
  final Color rightIconColor;
  // 右侧控件
  final Widget rightWidget;

  // 标题
  final String title;
  final Color titleColor;
  // 描述
  final String describe;
  final Color describeColor;

  // 构造函数
  VFListItem({
    Key key,
    this.onPressed,
    this.leftIcon,
    this.leftWidget,
    this.leftIconColor: VFColors.grey,
    this.rightIcon,
    this.rightIconColor: VFColors.grey,
    this.rightWidget,
    this.title,
    this.titleColor: VFColors.black,
    this.describe,
    this.describeColor: VFColors.grey,
  }) : super(key: key);

  @override
  VFListItemState createState() => VFListItemState();
}

class VFListItemState extends State<VFListItem> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: widget.onPressed,
      padding: EdgeInsets.all(VFDimens.d_0),
      child: Container(
        height: VFDimens.list_item_large,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            // 左侧图标
            widget.leftIcon != null
                ? Container(
                    child: SizedBox(
                      height: VFDimens.list_item_normal,
                      width: VFDimens.list_item_normal,
                      child: Icon(
                        widget.leftIcon,
                        size: VFDimens.d_24,
                        color: widget.leftIconColor,
                      ),
                    ),
                  )
                : Container(
                    width: VFDimens.margin_normal,
                  ),
            widget.leftWidget == null ? Container() : widget.leftWidget,
            // 中间内容
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 标题
                  widget.title != null
                      ? Text(
                          widget.title,
                          style: TextStyle(
                            color: widget.titleColor,
                            fontSize: VFSizes.list_item_title,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Container(),
                  // 描述
                  widget.describe != null
                      ? Text(
                          widget.describe,
                          maxLines: 2,
                          style: TextStyle(
                              color: widget.describeColor,
                              fontSize: VFSizes.list_item_desc),
                        )
                      : Container(),
                ],
              ),
            ),
            // 右侧图标
            widget.rightIcon != null
                ? Container(
                    child: SizedBox(
                      height: VFDimens.list_item_normal,
                      width: VFDimens.list_item_normal,
                      child: Icon(
                        widget.rightIcon,
                        size: VFDimens.d_20,
                        color: widget.rightIconColor,
                      ),
                    ),
                  )
                : Container(),
            widget.rightWidget != null ? widget.rightWidget : Container(),
          ],
        ),
      ),
    );
  }
}
