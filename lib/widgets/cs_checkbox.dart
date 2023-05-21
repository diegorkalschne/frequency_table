import 'package:flutter/material.dart';

class CsCheckbox<T> extends StatelessWidget {
  const CsCheckbox({
    required this.value,
    required this.label,
    required this.onChanged,
    required this.groupValue,
    super.key,
  });

  final T value;
  final T groupValue;
  final void Function(T?)? onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(unselectedWidgetColor: Colors.white),
      child: RadioListTile<T>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(
          '$label',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        activeColor: theme.primaryColor,
        toggleable: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
