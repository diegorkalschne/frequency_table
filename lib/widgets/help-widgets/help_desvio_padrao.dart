import 'package:flutter/material.dart';

import '../../consts/assets/assets_path.dart';
import 'help_base.dart';

class HelpDesvioPadrao extends StatelessWidget {
  const HelpDesvioPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpBase(
      text: 'O desvio padrão é a média das medidas das informações em torno do valor médio.\n- Permite estimar a variação não controlada.\n- É uma medida da variação de todos os valores a partir da média.',
      image: AssetsPath.DESVIO_PADRAO,
    );
  }
}
