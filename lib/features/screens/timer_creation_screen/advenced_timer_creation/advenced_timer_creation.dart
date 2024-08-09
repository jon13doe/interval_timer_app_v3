import 'package:flutter/material.dart';
import 'package:interval_timer_app_v3/theme/sizes.dart';

class AdvencedTimerCreation extends StatefulWidget {
  const AdvencedTimerCreation({super.key});

  @override
  State<AdvencedTimerCreation> createState() => _AdvencedTimerCreationState();
}

class _AdvencedTimerCreationState extends State<AdvencedTimerCreation> {
  int elements = 5;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: elements,
              (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: index == elements - 1 ? 0 : medium.padding),
              child: InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      height: 0.9 * MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      child: const Center(
                        child: Text('i'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
