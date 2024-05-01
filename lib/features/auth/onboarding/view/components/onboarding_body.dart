import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({Key? key, required this.controller}) : super(key: key);

  final OnboardingControllerCubit controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: BlocProvider(
            create: (context) => controller,
            child: BlocBuilder<OnboardingControllerCubit,
                OnboardingControllerState>(
              builder: (context, state) {
                final controller = context.read<OnboardingControllerCubit>();

                return PageView(
                  controller: controller.pageController,
                  children: List.generate(controller.data.length, (index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //media query 
                        SizedBox(
                          width: size.width*0.7,
                          height: size.height*0.33,
                          child: Image.asset(controller.data[index].image,


                          )),
                        SizedBox(height: 16),
                        Text(
                          controller.data[index].title,
                          style: const TextStyle(
                            fontSize: 30,
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.bold,
                            color: Color(0xffdfbd90),
                          ),
                        ),
                        SizedBox(height: 8),
                        Center(
                          // Center the subtitle
                          child: Text(
                            controller.data[index].subTitle,
                            textAlign: TextAlign.center, // Align text to center
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Pacifico',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 2, 2, 2),
                            ),
                          ),
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
    );
  }
}
