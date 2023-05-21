import 'package:flutter/material.dart';

class CsInkWell extends StatelessWidget {
  const CsInkWell({
    required this.label,
    required this.onTap,
    super.key,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Text(
        '$label',
        style: TextStyle(
          color: theme.colorScheme.primaryContainer,
          fontSize: 16,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
