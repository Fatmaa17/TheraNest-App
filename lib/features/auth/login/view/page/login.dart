// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/login/view/components/data_widget.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/loginbg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: DataWidget(),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.transparent,
    );
  }
}
