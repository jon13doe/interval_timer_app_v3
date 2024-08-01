import 'package:flutter/material.dart';
import 'package:interval_timer_app_v3/theme/sizes.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MenuScreen> {
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
                  onPressed: () {},
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
              child: Column(
                children: [
                  Container(
                    height: 0.75 * kToolbarHeight,
                    color: Colors.amberAccent,
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
