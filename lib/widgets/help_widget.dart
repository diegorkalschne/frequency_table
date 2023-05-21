import 'package:flutter/material.dart';

import '../consts/enums.dart';
import '../services/dialog_service.dart';
import 'cs_icon.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({
    required this.child,
    required this.onHelp,
    this.position = HelpPosition.back,
    super.key,
  });

  final Widget child;
  final Widget onHelp;
  final HelpPosition position;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (position == HelpPosition.top) ...[child],
        Positioned(
          right: position == HelpPosition.back ? 0 : 5,
          top: position == HelpPosition.back ? -5 : 5,
          child: GestureDetector(
            onTap: () => openDialogWithContent(content: onHelp),
            child: CsIcon.icon(
              icon: Icons.help_outline_outlined,
              color: position == HelpPosition.back ? theme.primaryColor : theme.colorScheme.secondary,
            ),
          ),
        ),
        if (position == HelpPosition.back) ...[child],
      ],
    );
  }
}
