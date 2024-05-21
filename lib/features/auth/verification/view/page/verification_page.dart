import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/core/utilis/context_extention.dart';
import 'package:therapy_app/features/auth/verification/controller/cubit/verification_cubit.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/firebase.dart';

class verificationPage extends StatelessWidget {
  const verificationPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final FirebaseRepo firebaseRepo = FirebaseRepo();

    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: Scaffold(
        body: BlocBuilder<VerificationCubit, VerificationState>(
          builder: (context, state) {
            final VerificationCubit cubit = context.read<VerificationCubit>();
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/loginbg.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Please Verify Your Email!.",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  IconButton(
                    onPressed: () async {
                      await firebaseRepo.checkEmailVerification(context);
                    },
                    icon: const Icon(Icons.done, size: 60),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
