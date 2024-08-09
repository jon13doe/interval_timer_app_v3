import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/screens/app_page_view/app_page_view.dart';
import 'generated/l10n.dart';
import 'theme/theme.dart';

class IntervalTimerAppView extends StatelessWidget {
  const IntervalTimerAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: customLightTheme,
      dark: ThemeData(),
      initial: AdaptiveThemeMode.light,
      builder: (theme, light) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'Flutter Demo',
          home: const SafeArea(
            child: AppPageView(),
          ),
        );
      },
    );
  }
}
