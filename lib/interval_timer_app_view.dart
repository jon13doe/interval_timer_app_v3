import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/screens/app_page_view/app_page_view.dart';
import 'generated/l10n.dart';
import 'theme/theme.dart';

class IntervalTimerAppView extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const IntervalTimerAppView({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: customLightTheme,
      dark: customDarkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) {
        return MaterialApp(
          theme: theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const SafeArea(
            child: AppPageView(),
          ),
        );
      },
    );
  }
}
