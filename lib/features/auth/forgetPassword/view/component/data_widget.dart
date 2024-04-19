// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/login/view/page/login.dart';

class dataWidget extends StatelessWidget {
  const dataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Stack(
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
            const Padding(
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
                controller: TextEditingController(),
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
              child: const Text(
                'Reset Password',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                ),
              ),
              color: Color(0xFF3e3121),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const loginPage()),
                );
              },
              child: const Text(
                'Back to login',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                ),
              ),
              color: Color(0xFF3e3121),
            )
          ],
        ),
      ],
    );
  }
}
