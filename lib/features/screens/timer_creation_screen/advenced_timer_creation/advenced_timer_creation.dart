import 'package:flutter/material.dart';

class AdvencedTimerCreation extends StatefulWidget {
  const AdvencedTimerCreation({super.key});

  @override
  State<AdvencedTimerCreation> createState() => _AdvencedTimerCreationState();
}

class _AdvencedTimerCreationState extends State<AdvencedTimerCreation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.amber,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
