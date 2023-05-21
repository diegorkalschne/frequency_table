import 'package:flutter/material.dart';

import '../../consts/assets/assets_path.dart';
import 'help_base.dart';

class HelpAmplitudeTotal extends StatelessWidget {
  const HelpAmplitudeTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpBase(
      text: 'A amplitude total é utilizada para calcular a amplitude das classes. Ela é obtida através da diferença entre o limite superior e o limite inferior',
      image: AssetsPath.AMPLITUDE_TOTAL,
    );
  }
}
