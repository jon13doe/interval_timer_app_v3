import 'dart:developer';

import 'package:bloc/bloc.dart';

int initialScreen = 1;
int numbersOfScreens = 4;

class PageCubit extends Cubit<int> {
  PageCubit() : super(initialScreen);

  void changePage(int pageIndex) {
    if (pageIndex > numbersOfScreens) {
      emit(initialScreen);
      log('Need update screen number in app_page_view_cubit.dart');
    } else if (pageIndex < 0) {
      emit(initialScreen);
      log('Screen index must be greater than 0');
    } else {
      emit(pageIndex);
    }
  }
}
