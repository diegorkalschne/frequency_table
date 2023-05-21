import 'package:flutter/material.dart';

class CsElevatedButton extends StatelessWidget {
  const CsElevatedButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.height = 40,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final Widget? icon;
  final double height;

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 20;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue[900]!,
            Colors.blue[900]!,
            Colors.blue[600]!,
            Colors.blue[900]!,
            Colors.blue[900]!,
          ],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(12),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          )),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 5),
            ],
            Text(
              '$label',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
