import 'package:flutter/widgets.dart';

import '../../consts/assets/assets_path.dart';
import 'help_base.dart';

class HelpNumeroClasses extends StatelessWidget {
  const HelpNumeroClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpBase(
      text: 'O número de classes servirá para dizer quantos linhas a nossa tabela deverá ter.\n- Arredonda-se sempre para o próximo valor inteiro.\n- Há casos onde pode ser necessário uma classe a mais do que o valor encontrado através da fórmula!',
      image: AssetsPath.NUMERO_CLASSES,
    );
  }
}
