import 'package:flutter/widgets.dart';

import '../../consts/assets/assets_path.dart';
import 'help_base.dart';

class HelpAmplitudeClasses extends StatelessWidget {
  const HelpAmplitudeClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpBase(
      text: 'A amplitude das classes servirá para dimensionar o intervalo que cada classes estará representando.\n- Arredonda-se sempre para o próximo valor inteiro.',
      image: AssetsPath.AMPLITUDE_CLASSES,
    );
  }
}
