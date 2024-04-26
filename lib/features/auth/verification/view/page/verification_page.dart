
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:therapy_app/core/utilis/context_extention.dart';
import 'package:therapy_app/features/auth/verification/controller/cubit/verification_cubit.dart';

class verificationPage extends StatelessWidget {
  const verificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          final VerificationCubit cubit = context.read<VerificationCubit>();
          return Scaffold(
            //  appBar: AppBar(backgroundColor: Color.transparent,),
            body: Container(
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
                    height: 30,
                  ),
                  const Text(
                    "please Enter your code",
                    style: TextStyle(
                        color: Color(0xFF3e3121),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico'),
                  ),
                  const SizedBox(
                    height:30,
                  ),
                 
                    PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.center,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 5,
                      obscureText: true,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          // fieldOuterPadding: EdgeInsets.all(
                          //  context.width/75),
                          fieldHeight:  context.width/10,
                          fieldWidth: context.height /10,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Color(0xffE4D7A3),
                          inactiveColor: Color(0xffE4D7A3),
                          activeColor:  Color(0xffE4D7A3),
                          selectedFillColor: Colors.white,
                          selectedColor:  Color(0xffE4D7A3)),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      controller: cubit.pinCodeController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {},
                    ),
                  
                  IconButton(onPressed: cubit.confirm, icon: Icon(Icons.done,
                  size: 50, color: Color(0xFF3e3121),)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
