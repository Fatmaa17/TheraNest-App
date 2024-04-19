import 'package:flutter/material.dart';
import 'package:therapy_app/core/utilis/validation.dart';

// ignore: must_be_immutable
class DataWidget extends StatelessWidget {
  DataWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const Text(
              "Create Account",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Text("Enter Details To Get Started"),
              const SizedBox(
                height:30,
                ),
      
          //name 
         TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
            controller:TextEditingController() ,
            keyboardType: TextInputType.name,
            validator:TheraNestValidation().nameValidate,
             decoration: decoration.copyWith(
              prefixIcon: const Icon(Icons.supervised_user_circle_outlined),
               labelText: 'User Name'
      
             )
         ),
          const SizedBox(
                height:15,
              ),
              //email form
           TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
            controller:TextEditingController() ,
            keyboardType: TextInputType.emailAddress,
            validator:TheraNestValidation().emailValidator,
             decoration:decoration.copyWith(
               labelText: 'Email Address',
               hintText: '*******@gmail.com'
             )
         ),
          const SizedBox(
                height: 15,
                ),
                //password
                  TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: TextEditingController(),
           keyboardType: TextInputType.visiblePassword,
            validator:TheraNestValidation().passwordValidator,
             obscureText: true,
             decoration:decoration.copyWith(
               labelText: 'Password',
              prefixIcon: const Icon(Icons.lock),  
             )
         ),
          const SizedBox(
                height: 15,
                ),
        //confirm password
                  TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: TextEditingController(),
           keyboardType: TextInputType.visiblePassword,
            validator: (value) {
                  return TheraNestValidation.repeatPasswordValidator(
                      value: value, password: TextEditingController().text);
                },
             obscureText: true,
             decoration:decoration.copyWith(
               labelText: 'Confirm Password',
               prefixIcon: const Icon(Icons.password),  
             )
         ),
      
        ],
        
          
      ),
    );
  }
InputDecoration decoration=InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: 'Email Address',
               border: UnderlineInputBorder(
                 borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color:Color(0xffE3D7A4),
                  width: 2,
                ) 
               ),
               focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff704F34),
                  width: 2,
                ) 
               ),
               errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffE3453E),
                  width:2,
                ) 
               )
              );
}