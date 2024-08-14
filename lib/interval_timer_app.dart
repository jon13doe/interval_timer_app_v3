import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:interval_timer_app_v3/features/app_settings/index.dart';

import 'interval_timer_app_view.dart';

class IntervalTimerApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const IntervalTimerApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppSettings?>(
        future: AppSettings.loadFromPrefs(),
        builder: (context, snapshot) {
          AppSettings appSettings = snapshot.data ??
              AppSettings(
                appTheme: 0,
              );
          return SettingsProvider(
            appSettings: appSettings,
            child: IntervalTimerAppView(savedThemeMode: savedThemeMode),
          );
        });
  }
}
