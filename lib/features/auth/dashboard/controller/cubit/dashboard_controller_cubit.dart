import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dashboard_controller_state.dart';

class DashboardControllerCubit extends Cubit<DashboardControllerState> {
  DashboardControllerCubit() : super(DashboardChangeState());

  int selectedTapIndex = 0;
  final PageController pageController = PageController();
  void onChangeTapIndex(int index) {
    selectedTapIndex = index;
    pageController.jumpToPage(selectedTapIndex);
    emit(DashboardChangeState());
  }
}
