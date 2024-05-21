import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/firebase.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController cPassController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FirebaseRepo _firebaseRepo = FirebaseRepo();

  void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      log(firstNameController.text);
      log(passwordController.text);
      log(cPassController.text);
      log(mailController.text);

      _firebaseRepo.registerUser(mailController.text, passwordController.text, context);
    } else {
      print("Invalid inputs");
    }
  }
}
