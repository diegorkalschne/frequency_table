import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/dialog_service.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../utils/functions_utils.dart';
import '../cs_elevated_button.dart';
import '../cs_ink_well.dart';

class VisualizarDadosContent extends StatelessWidget {
  const VisualizarDadosContent({
    required this.numbers,
    super.key,
  });

  final List<double> numbers;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    numbers.sort();

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Entrada de Dados',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: theme.colorScheme.primaryContainer,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Flexible(
            child: SingleChildScrollView(
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: numbers
                    .map(
                      (e) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '${truncateZeroDouble(e)}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: CsElevatedButton(
              label: 'Fechar',
              onPressed: () => getIt<NavigationService>().pop(),
            ),
          ),
          const SizedBox(height: 15),
          CsInkWell(
            label: 'Copiar para a área de transferência',
            onTap: () async {
              List<String> numbers = this.numbers.map((e) => truncateZeroDouble(e)!).toList();
              String text = numbers.join(', ');
              await Clipboard.setData(ClipboardData(text: text));
              showSnackbar(description: 'Conteúdo copiado para a área de transferência', seconds: 2);
            },
          ),
        ],
      ),
    );
  }
}
