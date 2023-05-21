import 'package:flutter/material.dart';

class CsTextButton extends StatelessWidget {
  const CsTextButton({
    required this.label,
    this.onPressed,
    this.color,
    super.key,
  });

  final String label;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = this.color ?? Theme.of(context).colorScheme.secondary;

    return InkWell(
      onTap: onPressed,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      splashColor: theme.colorScheme.onSecondaryContainer,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            fontSize: 15,
            color: color,
          ),
        ),
      ),
    );
  }
}
