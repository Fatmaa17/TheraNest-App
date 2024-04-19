import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/login/view/components/custombtn.dart';
import 'package:therapy_app/features/auth/login/view/components/customtf.dart';
import 'package:therapy_app/features/auth/login/view/components/customtxtbtn.dart';
import 'package:therapy_app/features/auth/registration/view/page/registration_page.dart';

class dataWidget extends StatelessWidget {
  const dataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            const Center(
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
            const Padding(
              padding: EdgeInsets.only(left: 20),
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
            const SizedBox(height: 20),
            CustomTextField(hintText: 'Password', obscureText: true),
            SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
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
                            MaterialPageRoute(
                                builder: (context) => const RegestrationPage()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  /*CustomTextButton(
                    text: 'Forgot password.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => forget_pw()),
                      );
                    },
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
