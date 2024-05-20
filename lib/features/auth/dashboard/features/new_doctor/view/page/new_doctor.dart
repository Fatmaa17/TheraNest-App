import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:therapy_app/features/auth/dashboard/features/new_doctor/cubit/new_doctor_cubit.dart';
import 'package:therapy_app/features/auth/registration/view/components/text_input_formatter.dart';

class doctorPage extends StatelessWidget {
  const doctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewDoctorCubit(),
      child: BlocBuilder<NewDoctorCubit, NewDoctorState>(
        builder: (context, state) {
          final NewDoctorCubit controller = NewDoctorCubit();

          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Add New Doctor",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 24,
                ),
              ),
              backgroundColor: Color(0xffE3D7A4),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  ///name
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
              
                  ///speciality
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.specialtyController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Specialty',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
              
                  ///sessionPrice
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.sessionPriceController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Session Price',
                      )),
                  const SizedBox(
                    height: 10,
                  ),
              
                  ///Experience Years
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.experienceYearsController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Experience Years',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
              
                  ///Languages
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.languagesController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Languages (comma-separated)',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
              
                  ///Fields
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.fieldsController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Fields (comma-separated)',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: controller.pickDoctorImage,
                          icon: Icon(CupertinoIcons.photo)),
                      IconButton(
                          onPressed: controller.takekDoctorImage,
                          icon: Icon(CupertinoIcons.camera)),
                    ],
                  ),

                  ///adding image 
                if(controller.image!=null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.file(File(controller.image!.path),
                  height: 200,
                  width:200,
                  fit: BoxFit.cover,),
                ),
                  
                  
                  Spacer(),
                  TextButton(
                      onPressed:()=>controller.addDoctor(context),
                      child: Text(
                        "Add Doctor",
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
