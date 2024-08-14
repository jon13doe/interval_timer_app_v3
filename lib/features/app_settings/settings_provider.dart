import 'package:flutter/widgets.dart';
import 'app_settings.dart';

class SettingsProvider extends InheritedNotifier<ValueNotifier<AppSettings>> {
  final AppSettings appSettings;

  SettingsProvider({
    super.key,
    required this.appSettings,
    required super.child,
  }) : super(
          notifier: ValueNotifier<AppSettings>(appSettings),
        );

  static AppSettings? of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<SettingsProvider>();
    return provider?.notifier?.value;
  }

  void updateThemeChema(AppSettings newAppSettings) {
    notifier?.value = newAppSettings;
  }
}
