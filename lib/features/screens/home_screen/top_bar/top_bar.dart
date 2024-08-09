import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:interval_timer_app_v3/features/blocks/app_page_view_cubit.dart';
import 'package:interval_timer_app_v3/features/widgets/index.dart';
import 'package:interval_timer_app_v3/theme/sizes.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int noticeType = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: kToolbarHeight,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.settings),
            iconSize: medium.iconSize,
            onPressed: () {
              context.read<PageCubit>().changePage(0);
            },
          ),
          Visibility(
            visible: noticeType == 0,
            replacement: const Expanded(
              child: Center(
                child: Text('Interval Timer'),
              ),
            ),
            child: const Expanded(
              child: VolumeSlider(),
            ),
          ),
          DynamicIconButton(
            iconsList: const [
              Icons.volume_up,
              Icons.vibration,
              Icons.volume_off,
            ],
            iconSize: medium.iconSize,
            onStateChange: (index) {
              setState(() {
                noticeType = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
