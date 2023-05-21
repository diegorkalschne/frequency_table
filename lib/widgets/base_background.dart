import 'package:flutter/material.dart';

import '../consts/assets/assets_path.dart';

class BaseBackground extends StatelessWidget {
  const BaseBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: const AssetImage(AssetsPath.BACKGROUND_IMAGE),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.95),
            BlendMode.luminosity,
          ),
        ),
      ),
      child: child,
    );
  }
}
