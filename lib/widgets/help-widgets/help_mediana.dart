import 'package:flutter/material.dart';

import '../../consts/assets/assets_path.dart';
import 'help_base.dart';

class HelpMediana extends StatelessWidget {
  const HelpMediana({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpBase(
      text: 'A mediana é o número que se encontra exatamente no centro de uma série de números, ou seja, separa os valores em dois subconjuntos de mesmo número de elementos',
      image: AssetsPath.MEDIANA,
    );
  }
}
