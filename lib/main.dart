import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'interval_timer_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(IntervalTimerApp(savedThemeMode: savedThemeMode));
}
