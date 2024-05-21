import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/core/utilis/validation.dart';
import 'package:therapy_app/features/auth/registration/controller/registration_cubit.dart';
import 'package:therapy_app/features/auth/registration/view/components/text_input_formatter.dart';

class DataWidget extends StatelessWidget {
  final RegistrationCubit controller;

  DataWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            return Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create Account",
                    style: TextStyle(
                    
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  const Text(
                    "Enter Details To Get Started",
                    style: TextStyle(fontFamily: 'Pacifico'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // Name
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.firstNameController,
                    keyboardType: TextInputType.name,
                    validator: TheraNestValidation().nameValidate,
                    inputFormatters: [NameInputFormatter()],
                    decoration: decoration.copyWith(
                      prefixIcon: const Icon(Icons.supervised_user_circle_outlined),
                      labelText: 'User Name',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Email
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.mailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: TheraNestValidation().emailValidator,
                    decoration: decoration.copyWith(
                      labelText: 'Email Address',
                      hintText: '*******@gmail.com',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Password
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: TheraNestValidation().passwordValidator,
                    obscureText: true,
                    decoration: decoration.copyWith(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Confirm Password
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.cPassController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      return TheraNestValidation().repeatPasswordValidator(
                        value: value,
                        password: controller.passwordController.text,
                      );
                    },
                    obscureText: true,
                    decoration: decoration.copyWith(
                      labelText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.password),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  final InputDecoration decoration = InputDecoration(
    prefixIcon: const Icon(Icons.email_outlined),
    labelText: 'Email Address',
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Color(0xffE3D7A4),
        width: 2,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff18447E),
        width: 2,
      ),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffE3453E),
        width: 2,
      ),
    ),
  );
}
