import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:therapy_app/features/auth/dashboard/view/page/dashboard_page.dart';
import 'package:therapy_app/features/auth/verification/view/page/verification_page.dart';

class FirebaseRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void initializeAuthStateListener() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
 Future<void> registerUser(String email, String password, BuildContext context) async {
    try {
      // Create user with email and password
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send email verification
      await _firebaseAuth.currentUser!.sendEmailVerification();

      // Navigate to the verification page only if user registration is successful
      Navigator.of(context).pushReplacementNamed('verification');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        _showErrorDialog(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        _showErrorDialog(context, 'The account already exists for that email.');
      } else {
        print('An error occurred while creating the account.');
        _showErrorDialog(context, 'An error occurred while creating the account.');
      }
    } catch (e) {
      print(e);
      _showErrorDialog(context, 'An unexpected error occurred.');
    }
  }

   Future<void> signOut(BuildContext context) async {
    try {
      // Sign out from Firebase Auth
      await _firebaseAuth.signOut();

      // If using Google Sign-In, disconnect Google account
      // GoogleSignIn googleSignIn = GoogleSignIn();
      // if (await googleSignIn.isSignedIn()) {
      //   await googleSignIn.disconnect();
      // }

      // Navigate to the login screen and remove all previous routes
      Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
    } catch (e) {
      print('Error signing out: $e');
       showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text("error signing out try again please"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
   }
  Future<void> loginUser(String email, String password, BuildContext context) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.emailVerified) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DashboardPage();
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return verificationPage();
        }));
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        log('No user found for that email.');
        _showErrorDialog(context, 'Invalid email or password.');
      } else {
        _showErrorDialog(context, 'An error occurred. Please try again.');
      }
    }
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

        Navigator.of(context).pushReplacementNamed('dashboard');
        return userCredential;
      } else {
        print('Google sign-in canceled');
        _showErrorDialog(context, 'Google sign-in canceled.');
        throw FirebaseAuthException(
          message: 'Google sign-in canceled',
          code: 'ERROR_ABORTED_BY_USER',
        );
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      _showErrorDialog(context, 'Failed to sign in with Google. Please try again later.');
      rethrow;
    }
  }

   // Add this method to handle email verification
  Future<void> checkEmailVerification(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.reload();
      user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified) {
        Navigator.of(context).pushReplacementNamed('dashboard');
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: 'Warning',
          desc: 'Check Your Gmail',
        ).show();
      }
    }
  }

 // Function to send a password reset email
  Future<void> resetPassword(String email) async {
    try {
      // Send password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Handle errors
      throw e; // Re-throw the error for the caller to handle
    }
  }
  void _showErrorDialog(BuildContext context, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Error',
      desc: message,
    ).show();
  }
}
