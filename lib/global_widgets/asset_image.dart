import 'package:flutter/cupertino.dart';
import 'package:my_ndu/constants/colors.dart';
import 'package:my_ndu/constants/dimens.dart';

class MyAssetImage extends StatelessWidget {
  const MyAssetImage({
    Key? key,
    required this.imgAsset,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.scale,
    this.fit,
  }) : super(key: key);

  final String imgAsset;
  final double? width;
  final double? height;
  final double? maxWidth;
  final double? maxHeight;
  final double? scale;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? Dimens.screenWidth,
        maxHeight: maxHeight ?? Dimens.screenHeight,
      ),
      child: Image.asset(
        imgAsset,
        fit: fit ?? BoxFit.contain,
        errorBuilder: (ctx, url, err) => const Icon(
          CupertinoIcons.info,
          color: ColorValues.errorColor,
        ),
        width: width,
        height: height,
        scale: scale ?? 1.0,
      ),
    );
  }
}
