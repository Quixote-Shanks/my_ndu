import 'package:flutter/material.dart';
import 'package:my_ndu/constants/colors.dart';
import 'package:my_ndu/constants/dimens.dart';

class MyElevatedCard extends StatelessWidget {
  const MyElevatedCard({
    Key? key,
    required this.child,
    this.borderRadius,
    this.padding,
    this.margin,
    this.elevation,
    this.bgColor,
    this.shadowColor,
  }) : super(key: key);

  final Widget child;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? elevation;
  final Color? bgColor;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? Dimens.edgeInsets8,
      elevation: elevation ?? Dimens.zero,
      color: bgColor ?? Theme.of(context).cardTheme.color,
      shadowColor: shadowColor ?? Theme.of(context).cardTheme.shadowColor,
      surfaceTintColor: ColorValues.transparent,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? Dimens.four),
      ),
      child: Padding(
        padding: padding ?? Dimens.edgeInsets0,
        child: child,
      ),
    );
  }
}
