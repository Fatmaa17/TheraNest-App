import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/forgetPassword/view/component/data_widget.dart';

class forget_pw extends StatefulWidget {
  const forget_pw({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _forget_pwState();
  }
}

class _forget_pwState extends State<forget_pw> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataWidget(),
    );
  }
}
