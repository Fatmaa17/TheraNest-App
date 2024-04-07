// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width:
            double.infinity, // Make the button width expand to its parent width
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              fontFamily: 'Pacifico',
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF3e3121), // Button color
            onPrimary: Colors.white, // Text color
            padding: EdgeInsets.symmetric(vertical: 15), // Button padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Button border radius
            ),
          ),
        ),
      ),
    );
  }
}
