import 'package:flutter/material.dart';
import 'package:interval_timer_app_v3/features/screens/home_screen/home_screen.dart';
import 'package:interval_timer_app_v3/features/screens/menu_screen/menu_screen.dart';
import 'package:interval_timer_app_v3/features/screens/timer_creation_screen/timer_creation_screen.dart';

class AppPageView extends StatefulWidget {
  const AppPageView({super.key});

  @override
  State<AppPageView> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<AppPageView>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: _currentPageIndex);
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageViewController,
      onPageChanged: _handlePageViewChanged,
      children: const <Widget>[
        MenuScreen(),
        HomeScreen(),
        TimerCreationScreen(),
      ],
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  // void _updateCurrentPageIndex(int index) {
  //   _tabController.index = index;
  //   _pageViewController.animateToPage(
  //     index,
  //     duration: const Duration(milliseconds: 400),
  //     curve: Curves.easeInOut,
  //   );
  // }
}
