import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 254, 254),
      body: Column(
        children: [
          Expanded(
            child: BlocProvider(
              create: (context) => OnboardingControllerCubit(),
              child: BlocBuilder<OnboardingControllerCubit,
                  OnboardingControllerState>(
                builder: (context, state) {
                  OnboardingControllerCubit controller =
                      context.read<OnboardingControllerCubit>();

                  return PageView(
                    children: List.generate(controller.data.length, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(controller.data[index].image),
                          Text(
                            controller.data[index].title,
                            style: const TextStyle(
                                fontSize: 30,
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.bold,
                                color: Color(0xffdfbd90)),
                          ),
                          Text(
                            controller.data[index].subTitle,
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 2, 2, 2)),
                          )
                        ],
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
