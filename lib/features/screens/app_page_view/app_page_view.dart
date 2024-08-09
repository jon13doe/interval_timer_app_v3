import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer_app_v3/features/blocks/app_page_view_cubit.dart';
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

  int _currentPageIndex = 1;

  final List<Widget> screens = const [
    MenuScreen(),
    HomeScreen(),
    TimerCreationScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageCubit(),
      child: BlocListener<PageCubit, int>(
        listener: (context, pageIndex) {
          _updateCurrentPageIndex(pageIndex);
        },
        child: PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: screens,
        ),
      ),
    );
  }

  void _handlePageViewChanged(int pageIndex) async {
    setState(() {
      _currentPageIndex = pageIndex;
    });
    log('current $pageIndex swipe');
  }

  void _updateCurrentPageIndex(int pageIndex) async {
    setState(() {
      _currentPageIndex = pageIndex;
    });
    log('current $pageIndex cubit');
    await _pageViewController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
