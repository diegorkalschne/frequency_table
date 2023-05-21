import 'package:flutter/material.dart';

import '../../consts/constants.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../base_background.dart';
import '../cs_elevated_button.dart';

class SobreApp extends StatelessWidget {
  const SobreApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BaseBackground(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: size.width * 0.4,
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '${App.NAME}',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Divider(
                indent: 5,
                endIndent: 5,
                color: Colors.grey.withOpacity(0.3),
                thickness: 3,
                height: 5,
              ),
              const SizedBox(height: 5),
              const Text(
                '\t\tSistema desenvolvido durante o 5º semestre do curso de Ciência de Computação da UNIJUÍ (2023), para a disciplina de Ciência dos Dados, pelos estudantes: ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: App.CRIADORES.length,
                itemBuilder: (_, index) {
                  final criador = App.CRIADORES[index];
                  return Text(
                    '- $criador',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              CsElevatedButton(
                label: 'Fechar',
                onPressed: () {
                  getIt<NavigationService>().pop();
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
