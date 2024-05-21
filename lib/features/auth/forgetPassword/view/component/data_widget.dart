import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/firebase.dart';
import 'package:therapy_app/features/auth/login/view/page/login.dart';

class dataWidget extends StatelessWidget {
  dataWidget({super.key});
  TextEditingController emailController = TextEditingController();

  // Create an instance of FirebaseRepo
  final FirebaseRepo firebaseRepo = FirebaseRepo();

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
                controller: emailController,
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
            // Reset Password Button
            MaterialButton(
              onPressed: () async {
                // Check if email is empty
                if (emailController.text.isEmpty) {
                  // Show warning dialog if email is empty
                  // You can replace this with your preferred way of showing a warning
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please Enter Your Email'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }

                // Call the reset password function from FirebaseRepo
                try {
                  await firebaseRepo.resetPassword(emailController.text);
                  // Show success dialog
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Done'),
                        content: Text('Your password reset has been sent to your email'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } catch (e) {
                  // Handle errors
                  print("Error: $e"); // Log the error for debugging purposes
                  // Show error dialog
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('An error occurred. Please enter a valid email'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
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
            // Back to login button
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
