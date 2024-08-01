import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interval_timer_app_v3/theme/sizes.dart';

import 'quick_start_bar/index.dart';
import 'timers_list/index.dart';
import 'top_bar/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopBar(),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: medium.padding),
              child: CustomScrollView(
                slivers: [
                  const QuickStartBar(),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.amberAccent,
                      height: kToolbarHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Presets'),
                          InkWell(
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(
                                  25,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Add custom',
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.alarm_add,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const TimersList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
