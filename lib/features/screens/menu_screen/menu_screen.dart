import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer_app_v3/features/app_settings/index.dart';
import 'package:interval_timer_app_v3/features/blocks/app_page_view_cubit.dart';
import 'package:interval_timer_app_v3/features/data/strings.dart';
import 'package:interval_timer_app_v3/features/widgets/dynm_icon_button.dart';
import 'package:interval_timer_app_v3/theme/sizes.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'elements/index.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _HomeScreenState();
}

String themeColors({required int currentTheme}) {
  switch (currentTheme) {
    case 1:
      return 'Dark';
    case 2:
      return 'System';
    default:
      return 'Light';
  }
}

class _HomeScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  bool isOpenSoundMenu = false;
  bool isOpenColorsMenu = false;
  bool sipLastRest = true;

  int duration = 600;

  late AppSettings settings;
  late int curentSettings;

  late AnimationController _rotationControllerSounds;
  late AnimationController _rotationControllerColors;

  @override
  void initState() {
    _rotationControllerSounds = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    _rotationControllerColors = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    settings = SettingsProvider.of(context)!;
    curentSettings = settings.appTheme;
  }

  @override
  void dispose() {
    _rotationControllerSounds.dispose();
    _rotationControllerColors.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double rightElementWidth = 0.2 * MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: kToolbarHeight,
            width: MediaQuery.of(context).size.width,
            color: theme.appBarTheme.backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: medium.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Menu'),
                SizedBox(
                  width: rightElementWidth,
                  child: IconButton(
                    onPressed: () {
                      context.read<PageCubit>().changePage(1);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(medium.padding),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isOpenSoundMenu = !isOpenSoundMenu;
                              if (isOpenSoundMenu) {
                                if (isOpenColorsMenu) {
                                  _rotationControllerColors.reverse();
                                  isOpenColorsMenu = false;
                                }
                                _rotationControllerSounds.forward();
                              } else {
                                _rotationControllerSounds.reverse();
                              }
                            });
                          },
                          child: Container(
                            color: Colors.pinkAccent,
                            height: 0.8 * kToolbarHeight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Sounds'),
                                SizedBox(
                                  width: rightElementWidth,
                                  child: RotationTransition(
                                    turns: Tween(begin: 1.0, end: 0.5)
                                        .animate(_rotationControllerSounds),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        MenuRow(
                          title: 'Sound theme',
                          listElements: soundThemes,
                        ),
                        SizeTransition(
                          sizeFactor: CurvedAnimation(
                            parent: _rotationControllerSounds,
                            curve: Curves.ease,
                          ),
                          axis: Axis.vertical,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: phaseString.length,
                            itemBuilder: (context, index) {
                              return MenuRow(
                                title: phaseString[index],
                                listElements: soundList,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isOpenColorsMenu = !isOpenColorsMenu;
                              if (isOpenColorsMenu) {
                                if (isOpenSoundMenu) {
                                  _rotationControllerSounds.reverse();
                                  isOpenSoundMenu = false;
                                }
                                _rotationControllerColors.forward();
                              } else {
                                _rotationControllerColors.reverse();
                              }
                            });
                          },
                          child: Container(
                            color: Colors.pinkAccent,
                            height: 0.8 * kToolbarHeight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Colors'),
                                SizedBox(
                                  width: rightElementWidth,
                                  child: RotationTransition(
                                    turns: Tween(begin: 1.0, end: 0.5)
                                        .animate(_rotationControllerColors),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.8 * kToolbarHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Main theme'),
                              Row(
                                children: [
                                  Text(
                                    themeColors(currentTheme: curentSettings),
                                  ),
                                  DynamicIconButton(
                                    iconsList: const [
                                      Icons.light_mode,
                                      Icons.dark_mode,
                                      Symbols.settings_night_sight,
                                    ],
                                    initState: curentSettings,
                                    iconSize: 32,
                                    onStateChange: (index) {
                                      setState(() {
                                        settings.switchAppTheme(index);
                                        curentSettings = settings.appTheme;
                                        if (index == 0) {
                                          AdaptiveTheme.of(context).setLight();
                                        } else if (index == 1) {
                                          AdaptiveTheme.of(context).setDark();
                                        } else if (index == 2) {
                                          AdaptiveTheme.of(context).setSystem();
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        MenuRow(
                          title: 'Timer theme',
                          listElements: timersThemes,
                        ),
                        SizeTransition(
                          sizeFactor: CurvedAnimation(
                            parent: _rotationControllerColors,
                            curve: Curves.ease,
                          ),
                          axis: Axis.vertical,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: phaseString.length - 1,
                            itemBuilder: (context, index) {
                              return MenuRow(
                                title: phaseString[index + 1],
                                listElements: colorsList,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.pinkAccent,
                          height: 0.8 * kToolbarHeight,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Miscellaneous'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.8 * kToolbarHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Skip last rest'),
                              SizedBox(
                                width: rightElementWidth,
                                child: Transform.scale(
                                  scale: 0.75,
                                  child: Switch(
                                      value: sipLastRest,
                                      onChanged: (newValue) {
                                        setState(() {
                                          sipLastRest = newValue;
                                        });
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 0.8 * kToolbarHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Final count'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
