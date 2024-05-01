import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  // dash conf
  PageController pageController = PageController();
  int currentIndex = 0; // Initialize currentIndex to 0 for the "Home" tab

  void onChangeTab(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    emit(DashboardInitial()); // Emitting DashboardInitial state
  }

  DashboardCubit() : super(DashboardInitial());
}
