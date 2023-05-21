import 'dart:ui';

import 'package:flutter/material.dart';

import '../consts/enums.dart';
import '../widgets/alert_dialog_content.dart';
import '../widgets/cs_text_button.dart';
import 'navigation_service.dart';
import 'service_locator.dart';

final _navigatorKey = getIt<NavigationService>().navigatorKey;

bool _dialogOpen = false;

Future<T?> openSimpleDialog<T>({
  required String title,
  required String description,
  List<Widget>? actions,
  DialogAction defaultAction = DialogAction.none,
  bool tapDismiss = true,
}) async {
  actions = _defaultAction(defaultAction);

  _dialogOpen = true;

  return await showDialog<T>(
    context: _navigatorKey.currentContext!,
    barrierDismissible: tapDismiss,
    useSafeArea: true,
    builder: (context) {
      return WillPopScope(
        onWillPop: () {
          return Future.value(tapDismiss);
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(
            title: Text(title),
            content: Text(
              description,
              textAlign: TextAlign.justify,
            ),
            actions: actions,
          ),
        ),
      );
    },
  ).then((value) {
    _dialogOpen = false;
    return value;
  });
}

Future<dynamic> openDialogWithContent<T>({
  required Widget content,
  bool tapDismiss = true,
}) async {
  _dialogOpen = true;

  return await showDialog<T>(
    context: _navigatorKey.currentContext!,
    barrierDismissible: tapDismiss,
    builder: (context) {
      return AlertDialogContent(content: content);
    },
  ).then((value) {
    _dialogOpen = false;
    return value;
  });
}

void closeDialog() async {
  if (_dialogOpen) {
    Navigator.pop(_navigatorKey.currentContext!);
  }
}

List<Widget>? _defaultAction(DialogAction defaultAction) {
  if (defaultAction == DialogAction.ok) {
    return [
      CsTextButton(
        label: 'OK',
        color: Theme.of(_navigatorKey.currentContext!).primaryColor,
        onPressed: () => Navigator.pop(_navigatorKey.currentContext!),
      ),
    ];
  } else if (defaultAction == DialogAction.sim_nao) {
    return [
      CsTextButton(
        label: 'SIM',
        color: Theme.of(_navigatorKey.currentContext!).primaryColor,
        onPressed: () => Navigator.pop(_navigatorKey.currentContext!, true),
      ),
      CsTextButton(
        label: 'NÃO',
        color: Theme.of(_navigatorKey.currentContext!).primaryColor,
        onPressed: () => Navigator.pop(_navigatorKey.currentContext!, false),
      ),
    ];
  }

  return null;
}

void showSnackbar({
  required String description,
  int seconds = 5,
  SnackBarAction? action,
  SnackBarBehavior? behavior,
}) {
  ScaffoldMessenger.of(_navigatorKey.currentContext!).removeCurrentSnackBar();

  ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(SnackBar(
    content: Row(
      children: [
        //Image.asset(AssetsPath.LOGO_APP, width: 30, height: 30),
        const SizedBox(width: 5),
        Expanded(child: Text('$description', textAlign: TextAlign.justify)),
      ],
    ),
    duration: Duration(seconds: seconds),
    behavior: behavior ?? SnackBarBehavior.floating,
    action: action,
  ));
}
