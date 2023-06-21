import 'package:flutter/material.dart';
import 'package:my_ndu/constants/colors.dart';
import 'package:my_ndu/constants/dimens.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({
    Key? key,
    this.size,
    this.strokeWidth,
    this.color,
    this.value,
  }) : super(key: key);

  final double? size;
  final double? strokeWidth;
  final Color? color;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? Dimens.sixTeen,
      height: size ?? Dimens.sixTeen,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? Dimens.three,
        color: color ?? ColorValues.primaryColor,
        value: value,
      ),
    );
  }
}
