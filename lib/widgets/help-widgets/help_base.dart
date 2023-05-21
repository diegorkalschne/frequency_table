import 'package:flutter/material.dart';

import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../base_background.dart';
import '../cs_elevated_button.dart';

class HelpBase extends StatelessWidget {
  const HelpBase({
    required this.text,
    this.image,
    this.title,
    super.key,
  });

  final String? title;
  final String text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

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
              if (title != null) ...[
                Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Divider(
                  color: theme.primaryColor,
                  indent: 5,
                  endIndent: 5,
                  thickness: 3,
                ),
              ],
              Text(
                '$text',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              if (image != null) ...[
                const SizedBox(height: 10),
                Image.asset(image!),
              ],
              const SizedBox(height: 10),
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
