import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';

enum ImageType { png, pngNetwork }

class ImageWidget extends StatelessWidget {
  final double? width, height, imageWidth, imageHeight, radiusCircular;
  final Color? backgroundColor, color;
  final String image;
  final ImageType imageType;
  final AlignmentGeometry alignment;

  const ImageWidget({
    super.key,
    required this.image,
    this.imageType = ImageType.png,
    this.color,
    this.imageWidth,
    this.imageHeight,
    this.width,
    this.height,
    this.backgroundColor,
    this.radiusCircular,
    this.alignment = AlignmentDirectional.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radiusCircular ?? 0),
      ),
      child: Builder(
        builder: (context) {
          switch (imageType) {
            case ImageType.png:
              return SvgPicture.asset(
                image,
                colorFilter:
                    color != null
                        ? ColorFilter.mode(color!, BlendMode.srcIn)
                        : null,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              );
            case ImageType.pngNetwork:
              return CachedNetworkImage(
                imageUrl: image,
                color: color,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              );
          }
        },
      ),
    );
  }
}
