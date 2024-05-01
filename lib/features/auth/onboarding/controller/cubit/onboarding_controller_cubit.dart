// ignore_for_file: prefer_const_constructors, unused_local_variable, use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapy_app/features/auth/onboarding/model/OnboardingModel.dart';
import 'package:therapy_app/features/auth/registration/view/page/registration_page.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());

  PageController pageController = PageController();

  void onChangeToNext() {
    pageController.nextPage(
        duration: Duration(seconds: 2), curve: Curves.linear);
  }

  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('onboarding', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const RegestrationPage(),
      ),
    );
  }

  List data = [
    OnboardingModel(
        image: 'assets/images/01.jpeg',
        title: 'Welcome to TheraNest',
        subTitle:
            'Begin your mental wellness journey online. Take the next step towards leading a healthier, more balanced life.'),
    OnboardingModel(
        image: 'assets/images/02.jpeg',
        title: 'Your Wellness Space',
        subTitle:
            'Equipped with services, tools, and resources to guide you on your wellness journey.'),
    OnboardingModel(
        image: 'assets/images/03.jpeg',
        title: 'Qualified Professionals',
        subTitle:
            'Our network is made up of culturally-relevant, bilingual, highly-trained professionals, qualified to support you.'),
  ];
}
