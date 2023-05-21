import 'package:flutter/material.dart';

class ThemeApp {
  static final ligthTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: Colors.blue.shade600,
      secondary: Colors.blue.shade800,
      primaryContainer: Colors.blueGrey,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade900,
      elevation: 20,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 26,
        shadows: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.white,
            spreadRadius: 50,
            offset: Offset(0, 0),
          ),
        ],
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey.shade300,
      border: _border,
      errorBorder: _border,
      enabledBorder: _border,
      focusedBorder: _border,
      focusedErrorBorder: _border,
      disabledBorder: _border,
      hoverColor: Colors.grey.shade50,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.blue.shade900,
      selectionColor: Colors.grey,
    ),
  );

  static final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(
      color: Colors.blue.shade900,
      width: 3,
    ),
  );
}
