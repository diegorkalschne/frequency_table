import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../consts/enums.dart';

class CsTextfield extends StatelessWidget {
  const CsTextfield({
    required this.label,
    this.obrigatorio = false,
    this.icon,
    this.iconAlign = IconAlign.rigth,
    this.onChanged,
    this.enabled = true,
    this.validator,
    this.inputFormatters,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.textAlign = TextAlign.left,
    this.maxLength,
    this.maxLines = 1,
    super.key,
  });

  final String label;
  final bool obrigatorio;
  final Widget? icon;
  final IconAlign? iconAlign;
  final void Function(String?)? onChanged;
  final bool enabled;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextAlign textAlign;
  final int? maxLength;
  final int? maxLines;

  Widget _buildIcon() {
    if (iconAlign == IconAlign.left) {
      return Positioned(
        left: 5,
        bottom: 0,
        top: 0,
        child: icon!,
      );
    }

    if (iconAlign == IconAlign.rigth) {
      return Positioned(
        right: 5,
        bottom: 0,
        top: 0,
        child: icon!,
      );
    }

    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                '$label',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: obrigatorio ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (obrigatorio) ...[
              const Text(
                ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
        Stack(
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.inputDecorationTheme.fillColor,
                border: theme.inputDecorationTheme.border,
                errorBorder: theme.inputDecorationTheme.errorBorder,
                enabledBorder: theme.inputDecorationTheme.enabledBorder,
                focusedBorder: theme.inputDecorationTheme.focusedBorder,
                disabledBorder: theme.inputDecorationTheme.disabledBorder,
                focusedErrorBorder: theme.inputDecorationTheme.focusedErrorBorder,
                hoverColor: theme.inputDecorationTheme.hoverColor,
                contentPadding: EdgeInsets.only(
                  left: icon != null && iconAlign == IconAlign.left ? 50 : 20,
                  right: icon != null && iconAlign == IconAlign.rigth ? 50 : 20,
                  top: 5,
                  bottom: 12,
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                counterText: '',
              ),
              textAlign: textAlign,
              autocorrect: false,
              enableSuggestions: false,
              onChanged: onChanged,
              enabled: enabled,
              validator: validator,
              inputFormatters: inputFormatters,
              controller: controller,
              keyboardType: keyboardType,
              style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontSize: 24,
              ),
              maxLength: maxLength,
              maxLines: maxLines,
            ),
            if (icon != null) ...[
              _buildIcon(),
            ],
          ],
        ),
      ],
    );
  }
}
