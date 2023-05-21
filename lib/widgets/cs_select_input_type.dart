import 'package:flutter/material.dart';

import 'cs_icon.dart';

class CsSelectInputType extends StatelessWidget {
  const CsSelectInputType({
    required this.child,
    required this.onPressed,
    this.selected = false,
    this.tooltip,
    super.key,
  });

  final Widget child;
  final bool selected;
  final VoidCallback onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Colors.grey.shade400,
                    offset: const Offset(0, 0),
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: child,
              ),
            ),
            if (selected) ...[
              Positioned(
                right: -5,
                top: -5,
                child: CsIcon.icon(
                  icon: Icons.check_circle,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
