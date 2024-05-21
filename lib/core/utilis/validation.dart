class TheraNestValidation{
  String? nameValidate(String? displayName)
  {
     if (displayName == null || displayName.isEmpty) {
      return 'Please Enter Your Name';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display name must be between 3 and 20 characters';
    }
//correct
    return null;
  }
  //email
   String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  //pass
  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be atleast 6 characters';
    }
    return null;
  }

  String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'Password doesn\'t match';
    }
    return null;
  }
}