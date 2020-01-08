import 'package:flutter/material.dart';

import 'package:vf_plugin/src/constants/vf_colors.dart';
import 'package:vf_plugin/src/constants/vf_dimens.dart';

class VFTopBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double top;
  final String title;
  final double titleSize;
  final Color titleColor;
  final bool centerTitle;
  final IconData leftIcon;
  final Widget leftWidget;
  final IconData rightIcon;
  final VoidCallback rightIconAction;
  final Color bgColor;

  VFTopBar({
    Key key,
    this.height: VFDimens.bar_normal,
    this.top,
    this.title,
    this.titleSize: VFSizes.title,
    this.titleColor: VFColors.greyBlack,
    this.centerTitle: false,
    this.leftIcon,
    this.leftWidget,
    this.rightIcon,
    this.rightIconAction,
    this.bgColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VFTopBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(VFDimens.d_48);
}

///
/// 自定义标题栏
///
class VFTopBarState extends State<VFTopBar> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);

    return Container(
      padding: EdgeInsets.only(top: widget.top),
      height: widget.height + widget.top,
      color: widget.bgColor ?? appBarTheme.color ?? themeData.primaryColor,
      child: Row(children: <Widget>[
        widget.leftIcon != null
            ? Container(
                child: SizedBox(
                  height: widget.height,
                  width: widget.height,
                  child: IconButton(
                    icon: Icon(
                      widget.leftIcon,
                      size: VFDimens.d_24,
                      color: widget.titleColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              )
            : Container(
                width: VFDimens.margin_normal,
              ),
        widget.leftWidget != null ? widget.leftWidget : Container(),
        Center(
          child: Text(
            widget.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: widget.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: widget.titleSize,
            ),
          ),
        ),
        widget.rightIcon != null
            ? Container(
                child: SizedBox(
                  height: widget.height,
                  width: widget.height,
                  child: IconButton(
                    icon: Icon(
                      widget.rightIcon,
                      size: VFDimens.d_24,
                      color: widget.titleColor,
                    ),
                    onPressed: widget.rightIconAction,
                  ),
                ),
              )
            : Container(
                width: VFDimens.margin_normal,
              ),
      ]),
    );
  }
}
