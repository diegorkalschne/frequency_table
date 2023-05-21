import 'package:flutter/material.dart';

import '../utils/functions_utils.dart';

class CardResult extends StatelessWidget {
  const CardResult({
    required this.label,
    required this.result,
    this.resultList,
    this.tooltip,
    super.key,
  });

  final String label;
  final String result;
  final List? resultList;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Tooltip(
      message: tooltip,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.shade400,
              offset: const Offset(0, 0),
              spreadRadius: 2,
            ),
          ],
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            //Cabeçalho do card
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              ),
              padding: const EdgeInsets.all(2),
              child: Center(
                child: Text(
                  '$label',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //Exibição do resultado
            Container(
              constraints: const BoxConstraints(minHeight: 40),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade300,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
              ),
              padding: const EdgeInsets.all(2),
              child: Center(
                child: resultList != null
                    ? resultList!.isEmpty
                        ? const Text(
                            'Sem Informação',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: resultList!.length,
                            itemBuilder: (_, index) {
                              final item = resultList![index];

                              return Text(
                                '${item.label}: ${truncateZeroDouble((item.value as double).toStringAsFixed(4))}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              );
                            },
                            separatorBuilder: (_, __) => const SizedBox(height: 2),
                          )
                    : Text(
                        '$result',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
