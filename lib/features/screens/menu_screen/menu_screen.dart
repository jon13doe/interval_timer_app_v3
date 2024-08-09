import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer_app_v3/features/blocks/app_page_view_cubit.dart';
import 'package:interval_timer_app_v3/features/data/strings.dart';
import 'package:interval_timer_app_v3/theme/sizes.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  bool isOpenSoundMenu = false;
  bool isOpenColorsMenu = false;
  bool sipLastRest = true;

  int duration = 600;
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
  void dispose() {
    _rotationControllerSounds.dispose();
    _rotationControllerColors.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: kToolbarHeight,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Menu'),
                IconButton(
                  onPressed: () {
                    context.read<PageCubit>().changePage(1);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
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
                            height: kToolbarHeight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Sounds'),
                                RotationTransition(
                                  turns: Tween(begin: 1.0, end: 0.5)
                                      .animate(_rotationControllerSounds),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Theme'),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      bool selectedValue = false;
                                      return Dialog(
                                        insetPadding: const EdgeInsets.all(50),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    'Sound Themes',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: CustomScrollView(
                                                  slivers: [
                                                    SliverList(
                                                      delegate:
                                                          SliverChildBuilderDelegate(
                                                              childCount: 3,
                                                              (context, index) {
                                                        return Container(
                                                          color:
                                                              Colors.blue[50],
                                                          margin:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 5),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Theme ${(index + 1).toString()}',
                                                              ),
                                                              Radio(
                                                                value: 1,
                                                                groupValue:
                                                                    selectedValue,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    selectedValue =
                                                                        !selectedValue;
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Try'),
                                                  ),
                                                  const Expanded(
                                                    child: SizedBox(),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text('Beep'),
                              ),
                            ],
                          ),
                        ),
                        SizeTransition(
                          sizeFactor: CurvedAnimation(
                            parent: _rotationControllerSounds,
                            curve: Curves.ease,
                          ),
                          axis: Axis.vertical,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.amberAccent,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: phaseString.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(phaseString[index]),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text('Beep $index'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
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
                            height: kToolbarHeight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Colors'),
                                RotationTransition(
                                  turns: Tween(begin: 1.0, end: 0.5)
                                      .animate(_rotationControllerColors),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Theme'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('color'),
                              ),
                            ],
                          ),
                        ),
                        SizeTransition(
                          sizeFactor: CurvedAnimation(
                            parent: _rotationControllerColors,
                            curve: Curves.ease,
                          ),
                          axis: Axis.vertical,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.amberAccent,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: phaseString.length - 1,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(phaseString[index + 1]),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text('Beep $index + 1'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
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
                          height: kToolbarHeight,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Miscellaneous'),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Skip last rest'),
                              Switch(
                                  value: sipLastRest,
                                  onChanged: (newValue) {
                                    setState(() {
                                      sipLastRest = newValue;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.green,
                          child: const Row(
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
