import 'package:flutter/material.dart';

class AlertDialogContent extends StatelessWidget {
  const AlertDialogContent({
    required this.content,
    this.backgroundColor,
    super.key,
  });

  final Widget content;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(child: content),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      contentPadding: const EdgeInsets.all(0),
    );
  }
}
