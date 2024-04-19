import 'package:flutter/material.dart';

class ButtomNavigationWidget extends StatelessWidget {
  const ButtomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
height: 50,

              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE1D69E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onPressed: () {
                 
                },
                icon: const Icon(
                  Icons.verified_user,
                  color: Colors.black87,
                ),
                label: const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Do you have account already?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            )
      ],
    );
  }
}