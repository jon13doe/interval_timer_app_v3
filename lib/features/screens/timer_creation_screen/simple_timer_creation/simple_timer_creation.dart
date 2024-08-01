import 'package:flutter/material.dart';
import 'package:interval_timer_app_v3/features/widgets/index.dart';

class SimpleTimerCreation extends StatefulWidget {
  const SimpleTimerCreation({super.key});

  @override
  State<SimpleTimerCreation> createState() => _SimpleTimerCreationState();
}

class _SimpleTimerCreationState extends State<SimpleTimerCreation> {
  @override
  Widget build(BuildContext context) {
    double height = 0.75 * kToolbarHeight;
    double inputFormWidth = 0.55 * MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Stack(
          children: [
            Container(
              color: Colors.amber,
              child: Column(
                children: [
                  const Text('Prepare'),
                  TwoInputsRow(
                    initValue: 90,
                    maxValueFirst: 99,
                    maxValueSecond: 60,
                    numSize: height,
                    zeroExist: true,
                    onChange: (newValue) {},
                    width: inputFormWidth,
                  ),
                  const Text('Set'),
                  OneIntInputRow(
                    initValue: 5,
                    maxValue: 99,
                    numSize: height,
                    zeroExist: false,
                    onChange: (newValue) {},
                    width: inputFormWidth,
                  ),
                  const Text('Work'),
                  TwoInputsRow(
                    initValue: 90,
                    maxValueFirst: 99,
                    maxValueSecond: 60,
                    numSize: height,
                    zeroExist: true,
                    onChange: (newValue) {},
                    width: inputFormWidth,
                  ),
                  const Text('Rest'),
                  TwoInputsRow(
                    initValue: 90,
                    maxValueFirst: 99,
                    maxValueSecond: 60,
                    numSize: height,
                    zeroExist: true,
                    onChange: (newValue) {},
                    width: inputFormWidth,
                  ),
                  const Text('Cooldown'),
                  TwoInputsRow(
                    initValue: 90,
                    maxValueFirst: 99,
                    maxValueSecond: 60,
                    numSize: height,
                    zeroExist: true,
                    onChange: (newValue) {},
                    width: inputFormWidth,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(height: 0.5 * kToolbarHeight),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
