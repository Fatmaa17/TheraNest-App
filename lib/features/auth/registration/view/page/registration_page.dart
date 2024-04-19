import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/registration/view/components/bottom_widget.dart';
import 'package:therapy_app/features/auth/registration/view/components/data_widget.dart';

class RegestrationPage extends StatelessWidget {
  const RegestrationPage({super.key});

  @override
 Widget build(BuildContext context) {
  return Scaffold(
   
    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/signup.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: DataWidget(),
    ),
    bottomNavigationBar: const SizedBox(
      height:100,
      child: ButtomNavigationWidget(),
    ),
    extendBodyBehindAppBar: true,
    extendBody: true,
    backgroundColor: Colors.transparent,
  );
}

}



