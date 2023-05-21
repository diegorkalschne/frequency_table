import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CsIcon extends StatelessWidget {
  const CsIcon.svg({
    this.svgPath,
    this.color,
    this.size,
    super.key,
  })  : icon = null,
        imagePath = null;

  const CsIcon.icon({
    this.icon,
    this.color,
    this.size,
    super.key,
  })  : svgPath = null,
        imagePath = null;

  const CsIcon.image({
    this.imagePath,
    this.color,
    this.size,
    super.key,
  })  : svgPath = null,
        icon = null;

  final String? svgPath;
  final IconData? icon;
  final Color? color;
  final double? size;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      return Image.asset(
        imagePath!,
        width: size,
        height: size,
      );
    }

    if (svgPath != null) {
      return SvgPicture.asset(
        svgPath!,
        colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
        width: size,
        height: size,
      );
    }

    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
