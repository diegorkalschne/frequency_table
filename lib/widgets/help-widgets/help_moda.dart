import 'package:flutter/material.dart';

import '../../consts/assets/assets_path.dart';
import 'help_base.dart';

class HelpModa extends StatelessWidget {
  const HelpModa({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpBase(
      text: 'A moda divide o intervalo da classe modal em distâncias proporcionais às diferenças entre a frequência da classe modal com a frequência das classes adjacentes.\nCom a fórmula de Czuber, temos:',
      image: AssetsPath.MODA,
    );
  }
}
