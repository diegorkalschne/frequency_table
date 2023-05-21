import 'package:flutter/material.dart';

import '../../consts/assets/assets_path.dart';
import 'help_base.dart';

class HelpMedia extends StatelessWidget {
  const HelpMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpBase(
      text: 'A média aritmética representa um valor que poderia substituir todos os valores da variável, isto é, é o valor que a variável teria se em vez de "variável" ela fosse "constante"',
      image: AssetsPath.MEDIA,
    );
  }
}
