import 'package:flutter/services.dart';

class NameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only alphabetical characters and spaces
    final RegExp nameRegExp = RegExp(r'[a-zA-Z\s]');
    if (nameRegExp.hasMatch(newValue.text)) {
      return newValue;
    } else {
      // If the new value contains invalid characters, revert to the old value
      return oldValue;
    }
  }
}
