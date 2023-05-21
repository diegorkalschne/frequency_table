import 'package:flutter/material.dart';

class CsIconButton extends StatelessWidget {
  const CsIconButton({
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.size,
    Key? key,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget icon;
  final String? tooltip;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: onPressed,
      splashColor: theme.colorScheme.primaryContainer,
      focusColor: theme.colorScheme.primaryContainer,
      hoverColor: theme.colorScheme.primaryContainer,
      highlightColor: theme.colorScheme.primaryContainer,
      icon: icon,
      alignment: Alignment.center,
      tooltip: tooltip,
      padding: const EdgeInsets.all(0),
      iconSize: size,
    );
  }
}
