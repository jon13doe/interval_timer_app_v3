import 'package:flutter/material.dart';

final customDarkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
);

final customLightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.amber,
  ),
);
