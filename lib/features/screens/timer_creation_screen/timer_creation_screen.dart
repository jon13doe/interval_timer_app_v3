import 'package:flutter/material.dart';
import 'package:interval_timer_app_v3/features/widgets/index.dart';
import 'package:interval_timer_app_v3/theme/sizes.dart';

import 'advenced_timer_creation/index.dart';
import 'simple_timer_creation/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer_app_v3/features/blocks/app_page_view_cubit.dart';

class TimerCreationScreen extends StatefulWidget {
  const TimerCreationScreen({super.key});

  @override
  State<TimerCreationScreen> createState() => _TimerCreationPageState();
}

class _TimerCreationPageState extends State<TimerCreationScreen> {
  bool _simpleView = true;

  late PageController _pageViewController;

  int _currentCreationType = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: _currentCreationType);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
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
                IconButton(
                  onPressed: () {
                    context.read<PageCubit>().changePage(1);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _updateCurrentPageIndex(0);
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 2 * kToolbarHeight,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: _simpleView ? 2 : 1,
                        color: _simpleView ? Colors.redAccent : Colors.black,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Simple',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _updateCurrentPageIndex(1);
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 2 * kToolbarHeight,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: _simpleView ? 1 : 2,
                        color: _simpleView ? Colors.black : Colors.redAccent,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Advenced',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.save,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(medium.padding),
            child: Container(
              height: 0.75 * kToolbarHeight,
              color: Colors.amberAccent,
              child: const PresetNameBar(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: medium.padding)
                  .copyWith(bottom: medium.padding),
              child: PageView(
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
                children: const [
                  SimpleTimerCreation(),
                  AdvencedTimerCreation(),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.amberAccent,
            height: 0.5 * kToolbarHeight,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Total: '),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int typeIndex) async {
    if (_currentCreationType != typeIndex) {
      setState(() {
        _currentCreationType = typeIndex;
        _simpleView = !_simpleView;
      });
    }
  }

  void _updateCurrentPageIndex(int typeIndex) async {
    if (_currentCreationType != typeIndex) {
      setState(() {
        _currentCreationType = typeIndex;
        _simpleView = !_simpleView;
      });
    }
    await _pageViewController.animateToPage(
      typeIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
