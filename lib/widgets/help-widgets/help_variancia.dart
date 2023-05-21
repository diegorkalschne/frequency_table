import 'package:flutter/material.dart';

import '../../consts/assets/assets_path.dart';
import 'help_base.dart';

class HelpVariancia extends StatelessWidget {
  const HelpVariancia({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpBase(
      text: 'A variância é a medida das distâncias das informações em torno da média.\n- É expressa numa unidade quadrática em relação à unidade de medida da variável em questão.\n- É utilizada para calcular o desvio padrão.',
      image: AssetsPath.VARIANCIA,
    );
  }
}
