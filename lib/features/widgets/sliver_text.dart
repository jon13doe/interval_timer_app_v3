import 'package:flutter/material.dart';
import 'package:interval_timer_app_v3/theme/sizes.dart';

class SliverText extends StatelessWidget {
  final String text;
  const SliverText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: medium.padding),
        child: Container(
          color: Colors.amber,
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
