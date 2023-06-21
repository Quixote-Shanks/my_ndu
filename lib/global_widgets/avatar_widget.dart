import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_ndu/apis/models/entities/media_file.dart';
import 'package:my_ndu/constants/assets.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/global_widgets/circular_network_image.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.avatar,
    this.size,
    this.fit,
  }) : super(key: key);

  final MediaFile? avatar;
  final double? size;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (avatar != null && avatar!.url != null) {
      return MyCircleNetworkImage(
        imageUrl: avatar!.url!,
        radius: size ?? Dimens.eighty,
        fit: fit,
      );
    }
    return CircleAvatar(
      backgroundColor: Theme.of(context).textTheme.titleSmall!.color,
      radius: size,
      child: SvgPicture.asset(
        SvgAssets.maleAvatar,
        fit: fit ?? BoxFit.cover,
        semanticsLabel: 'User Avatar',
      ),
    );
  }
}
