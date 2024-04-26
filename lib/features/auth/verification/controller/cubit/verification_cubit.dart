import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

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
    }
    else{
      print("invalid");
    }
  }
}
