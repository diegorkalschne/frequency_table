import 'package:flutter/material.dart';

import '../../consts/assets/assets_path.dart';
import 'help_base.dart';

class HelpCoeficienteVariacao extends StatelessWidget {
  const HelpCoeficienteVariacao({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpBase(
      text: 'O coeficiente de variação mede em porcentagem a variação atribuída ao acaso.\n- Dá uma indicação da precisão do experimento.',
      image: AssetsPath.COEFICIENTE_VARIACAO,
    );
  }
}
