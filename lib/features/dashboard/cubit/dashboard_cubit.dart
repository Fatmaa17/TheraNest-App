import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  /// dash conf

  PageController pageController=PageController();
  int currentIndex=2;
  void onChangeTab(int index){
    currentIndex=index;
    pageController.jumpToPage(index);
    emit(DashboardInitial as DashboardState);
  }
  DashboardCubit() : super(DashboardInitial());
}
