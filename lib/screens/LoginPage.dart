// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:therapy_app/screens/forget_pw.dart';
import 'package:therapy_app/screens/signup.dart';
import 'package:therapy_app/widgets/custombtn.dart';
import 'package:therapy_app/widgets/customtf.dart';
import 'package:therapy_app/widgets/customtxtbtn.dart'; // Import the custom text button widget

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef7ef),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'TheraNest',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFe9ebc4),
                    fontFamily: 'Pacifico',
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF3e3121),
                    fontFamily: 'Pacifico',
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(hintText: 'Email'),
              SizedBox(height: 20),
              CustomTextField(hintText: 'Password', obscureText: true),
              SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF3e3121),
                          ),
                        ),
                        CustomTextButton(
                          text: 'Sign Up',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomTextButton(
                      text: 'Forgot password.',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => forget_pw()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
