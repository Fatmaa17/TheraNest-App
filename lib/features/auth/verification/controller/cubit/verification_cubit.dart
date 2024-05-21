// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());
  TextEditingController pinCodeController = TextEditingController();
  //valid code for verification
  final String code = '55555';
  void confirm() {
    if (pinCodeController.text == code) {
      //navigate from registration to home
      print("valid");
      emit(VerificationSuccess());
    } else {
      print("invalid");
      emit(VerificationFailure());
    }
  }
}
