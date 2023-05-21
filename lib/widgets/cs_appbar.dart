import 'package:flutter/material.dart';

import '../services/navigation_service.dart';
import '../services/service_locator.dart';
import 'cs_icon.dart';
import 'cs_icon_button.dart';

class CsAppbar extends StatelessWidget with PreferredSizeWidget {
  const CsAppbar({
    required this.title,
    this.forceHiddenLeading = false,
    this.actions = const [],
    super.key,
  });

  final String title;
  final bool forceHiddenLeading;
  final List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.blue[900]!,
            Colors.blue[900]!,
            Colors.blue[600]!,
            Colors.blue[900]!,
            Colors.blue[900]!,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (Navigator.canPop(context) && !forceHiddenLeading) ...[
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: CsIconButton(
                icon: const CsIcon.icon(
                  icon: Icons.arrow_back,
                  color: Colors.white,
                ),
                tooltip: 'Voltar',
                onPressed: () => getIt<NavigationService>().pop(),
              ),
            ),
          ],
          Expanded(
            child: Center(
              child: Text(
                '$title',
                textAlign: TextAlign.center,
                style: theme.appBarTheme.titleTextStyle,
              ),
            ),
          ),
          if (actions.isNotEmpty) ...[
            const SizedBox(width: 5),
            ...actions,
            const SizedBox(width: 5),
          ],
        ],
      ),
    );
  }
}
