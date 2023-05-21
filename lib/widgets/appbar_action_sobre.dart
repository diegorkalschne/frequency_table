import 'package:flutter/material.dart';

import '../services/dialog_service.dart';
import 'cs_icon.dart';
import 'cs_icon_button.dart';
import 'dialog/sobre_app.dart';

class AppbarActionSobre extends StatelessWidget {
  const AppbarActionSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return CsIconButton(
      icon: const CsIcon.icon(
        icon: Icons.info_outline_rounded,
        color: Colors.white,
        size: 28,
      ),
      onPressed: () {
        openDialogWithContent(content: const SobreApp());
      },
      tooltip: 'Sobre',
    );
  }
}
