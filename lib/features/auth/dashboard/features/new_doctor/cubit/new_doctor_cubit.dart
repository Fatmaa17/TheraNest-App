import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_cubit.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/DBRepo.dart';

part 'new_doctor_state.dart';

class NewDoctorCubit extends Cubit<NewDoctorState> {
  NewDoctorCubit() : super(NewDoctorInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController specialtyController = TextEditingController();
  TextEditingController sessionPriceController = TextEditingController();
  TextEditingController experienceYearsController = TextEditingController();
  TextEditingController languagesController = TextEditingController();
  TextEditingController fieldsController = TextEditingController();
  XFile? image;
  Future<void> pickDoctorImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    image = await picker.pickImage(source: ImageSource.gallery);
    emit(NewDoctorInitial());
  }

  Future<void> takekDoctorImage() async {
    final ImagePicker picker = ImagePicker();
// take an image.
    image = await picker.pickImage(source: ImageSource.camera);
    emit(NewDoctorInitial());
  }

  Future<void> addDoctor(Context) async {
    DBRepo db = DBRepo();
    db.initDatabase();
    Uint8List imageBytes = await image!.readAsBytes();
    String name = nameController.text;
    String specialty = specialtyController.text;
    double sessionPrice = double.parse(sessionPriceController.text) ??
        0.0; // Default to 0 if parsing fails
    int experienceYears = int.parse(experienceYearsController.text) ??
        0; // Default to 0 if parsing fails
    List<String> languages = languagesController.text.isNotEmpty
        ? languagesController.text.split(',')
        : [];
    List<String> fields = fieldsController.text.isNotEmpty
        ? fieldsController.text.split(',')
        : [];

    db.insertServices(
      imageBytes,
      name,
      specialty,
      sessionPrice,
      experienceYears,
      languages,
      fields,
    );
    await ServiceCubit.instance.initDatabase();
    Navigator.pop(context as BuildContext);
  }
}
