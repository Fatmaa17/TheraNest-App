
import 'package:flutter/material.dart';
import 'package:therapy_app/core/utilis/validation.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/firebase.dart';
import 'package:therapy_app/features/auth/forgetPassword/view/page/forgetPW.dart';
import 'package:therapy_app/features/auth/login/view/components/custombtn.dart';
import 'package:therapy_app/features/auth/login/view/components/customtxtbtn.dart';
import 'package:therapy_app/features/auth/registration/view/page/registration_page.dart';

class DataWidget extends StatelessWidget {
  DataWidget({Key? key});
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final FirebaseRepo firebaseRepo = FirebaseRepo();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 120),
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
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 30),
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
            const SizedBox(height: 20),

            ///email
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: TheraNestValidation().emailValidator,
              decoration: InputDecoration(
                labelText: 'Please Enter Your Email',
                prefixIcon: const Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 20),
            //password
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: TheraNestValidation().passwordValidator,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter Your Password',
                prefixIcon: const Icon(Icons.lock),
              ),
            ),

            const SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onPressed: () async {
                await firebaseRepo.loginUser(
                  emailController.text,
                  passwordController.text,
                  context,
                );
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await firebaseRepo.signInWithGoogle(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color(0xFF3e3121), 
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login with Google",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Pacifico',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/images/google.png',
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegestrationPage();
                          }));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextButton(
                    text: 'Forgot password.',
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return forget_pw();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
