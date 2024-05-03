import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_state.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/DBRepo.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/service_model/serviceModel.dart';

class ServiceCubit extends Cubit<ServiceState> {
///single ton
  static ServiceCubit instance =ServiceCubit();
  ServiceCubit() : super(ServiceLoading()) {
    initDatabase();
  }

  List<ServiceModel> services = [];
  DBRepo repo = DBRepo();
  Future<Uint8List> getImageBytes(String imagePath) async {
    final ByteData data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List();
  }

  Future<void> initDatabase() async {
    emit(ServiceLoading());
    Uint8List imageBytes = await getImageBytes('assets/images/Th1.jpg');

    await repo.initDatabase();
    repo.insertServices(imageBytes, 'Fatima', 'Psychologist', 500.0, 12,
        ['En', 'Fr'], ["Depression", 'Anxiety']);
    repo.insertServices(imageBytes, 'Amany', 'Psychologist', 666.0, 12,
        ['En', 'Fr'], ["Depression", 'Anxiety']);
    repo.insertServices(imageBytes, 'Elise Salwan', 'Psychologist', 1300.0, 10,
        ['En', 'Fr', 'Ar'], ["Depression", 'Anxiety', 'Panic Disorder']);
    repo.insertServices(imageBytes, 'Enas Risk', 'Psychologist', 850.0, 4,
        ['En', 'Ar'], ["Depression", 'anic Disorder']);
    repo.insertServices(imageBytes, 'Sara Sultan', 'Psychologist', 800.0, 3,
        ['En', 'Ar'], ["Female Sexual dysfunction", 'Couble Therapy']);
    services = await repo.fetchServices();
    log('Fetched ');
    if (services.isEmpty) {
      emit(ServiceEmpty());
    } else {
      emit(ServiceLoaded());
    }
  }
  

  void addItemToActivity(int id,int value){
    repo.updateActivity(value, id);
    initDatabase();
    emit(ServiceLoaded());

  }
}
