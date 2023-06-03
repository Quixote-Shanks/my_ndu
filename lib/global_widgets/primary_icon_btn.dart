import 'package:flutter/material.dart';
import 'package:my_ndu/constants/dimens.dart';

class NxIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final double? iconSize;
  final Color? bgColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? width;
  final bool? centerIcon;
  final double? height;

  const NxIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.bgColor,
    this.padding,
    this.iconSize,
    this.borderRadius,
    this.width,
    this.height,
    this.centerIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? Dimens.edgeInsets0,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius ?? Dimens.zero,
            ),
          ),
        ),
        child: centerIcon!
            ? Center(
                child: Icon(
                  icon,
                  size: iconSize ?? Dimens.twentyFour,
                  color: iconColor ?? Theme.of(context).iconTheme.color,
                ),
              )
            : Icon(
                icon,
                size: iconSize ?? Dimens.twentyFour,
                color: iconColor ?? Theme.of(context).iconTheme.color,
              ),
      ),
    );
  }
}
