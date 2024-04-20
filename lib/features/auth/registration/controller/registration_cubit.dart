// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());
  TextEditingController firstNameController=TextEditingController();
  TextEditingController cPassController=TextEditingController();
  TextEditingController mailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  void onPressedConfirmButton(){
    if(formKey.currentState!.validate() ){
      log(firstNameController.text);
      log(passwordController.text);
      log(cPassController.text);
      log(mailController.text);


    }
    else{
      print("invalid inputs");
    }
  }
}
