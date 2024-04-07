// ignore_for_file: prefer_const_constructors, sort_child_properties_last
//import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth package

import 'package:flutter/material.dart';

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
// if we have a firebase:
  /*Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      // Handle success, you can show a message or navigate to another screen
      print('Password reset email sent successfully');
    } catch (e) {
      // Handle errors, display them or log them
      print('Failed to send password reset email: $e');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Add the image to the background of the scaffold
          Center(
            child: Image.asset(
              'assets/images/forget.jpeg',
              width: screenSize.width,
              height: screenSize.height,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Enter Your Email To Reset',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Pacifico', // Applying Pacifico font
                    fontSize: 20,
                    color: Color(0xFF3e3121),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //email textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF3e3121)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF3e3121)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 10),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontFamily: 'Pacifico', // Applying Pacifico font
                    color: Colors.white, // Set text color to white
                  ),
                ),
                color: Color(0xFF3e3121),
              )
            ],
          ),
        ],
      ),
    );
  }
}
