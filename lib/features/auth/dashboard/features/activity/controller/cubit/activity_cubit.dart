import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/features/activity/controller/cubit/activity_state.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/DBRepo.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/service_model/serviceModel.dart';

class activityCubit extends Cubit<activityState> {
  ///single ton
  static activityCubit instance = activityCubit();
  activityCubit() : super(activityLoading()) {
    initDatabase();
  }

  List<ServiceModel> services = [];
  DBRepo repo = DBRepo();
  Future<Uint8List> getImageBytes(String imagePath) async {
    final ByteData data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List();
  }

  Future<void> initDatabase() async {
    emit(activityLoading());
    Uint8List imageBytes = await getImageBytes('assets/images/Th1.jpg');

    await repo.initDatabase();
    services = await repo.fetchActivityServices();
    log('Fetched ');
    if (services.isEmpty) {
      emit(activityEmpty());
    } else {
      emit(activityLoaded());
    }
  }

  Future<void> addItemToActivity(int id, int value) async {
    await repo.updateActivity(value, id);
    await initDatabase();
    await activityCubit.instance.initDatabase();
    emit(activityLoaded());
  }
}
