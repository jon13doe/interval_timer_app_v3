import 'package:flutter/material.dart';
import 'package:interval_timer_app_v3/features/widgets/index.dart';
import 'package:interval_timer_app_v3/theme/sizes.dart';

import 'advenced_timer_creation/index.dart';
import 'simple_timer_creation/index.dart';

class TimerCreationScreen extends StatefulWidget {
  const TimerCreationScreen({super.key});

  @override
  State<TimerCreationScreen> createState() => _TimerCreationPageState();
}

class _TimerCreationPageState extends State<TimerCreationScreen> {
  bool _simpleView = true;

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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (!_simpleView) {
                      setState(() {
                        _simpleView = !_simpleView;
                      });
                    }
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
                    if (_simpleView) {
                      setState(() {
                        _simpleView = !_simpleView;
                      });
                    }
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(medium.padding),
              child: Column(
                children: [
                  Container(
                    height: 0.75 * kToolbarHeight,
                    color: Colors.amberAccent,
                    child: const PresetNameBar(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: medium.padding),
                    child: _simpleView
                        ? const SimpleTimerCreation()
                        : const AdvencedTimerCreation(),
                  ),
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
}
