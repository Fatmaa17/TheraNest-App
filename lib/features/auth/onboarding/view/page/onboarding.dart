// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:therapy_app/features/auth/onboarding/view/components/onboarding_body.dart';
import 'package:therapy_app/features/auth/onboarding/view/components/onboarding_buttons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => OnboardingControllerCubit(),
      child: BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
        builder: (context, state) {
          OnboardingControllerCubit controller =
              context.read<OnboardingControllerCubit>();

          return  Scaffold(
              backgroundColor: Color.fromARGB(255, 254, 254, 254),
              body: OnboardingBody(controller: controller,),
              bottomNavigationBar: OnBoardingButtons(controller: controller,));
        },
      ),
    ));
  }
}
