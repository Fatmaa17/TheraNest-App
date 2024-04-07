import 'package:flutter/material.dart';
import 'package:therapy_app/screens/LoginPage.dart';

void main() => runApp(const therapy_app());

class therapy_app extends StatelessWidget {
  const therapy_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
