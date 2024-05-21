import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/registration/controller/registration_cubit.dart';

class BottomNavigationWidget extends StatelessWidget {
  final RegistrationCubit controller;

  const BottomNavigationWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationCubit>.value(
      value: controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE1D69E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      controller.onPressedConfirmButton(context);
                    },
                    icon: const Icon(
                      Icons.verified_user,
                      color: Colors.black87,
                    ),
                    label: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Do you have an account already?',
                      style: TextStyle(fontFamily: 'Pacifico'),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
