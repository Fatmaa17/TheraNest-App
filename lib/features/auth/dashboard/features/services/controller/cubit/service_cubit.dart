import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_state.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/DBRepo.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/service_model/serviceModel.dart';

class ServiceCubit extends Cubit<ServiceState> {
  static final ServiceCubit instance = ServiceCubit();
  ServiceCubit() : super(ServiceLoading()) {
    initDatabase();
  }

  List<ServiceModel> services = [];
  List<ServiceModel> filteredServices = [];
  DBRepo repo = DBRepo();

  Future<Uint8List> getImageBytes(String imagePath) async {
    final ByteData data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List();
  }

  Future<void> initDatabase() async {
    emit(ServiceLoading());
    Uint8List imageBytes = await getImageBytes('assets/images/Th1.jpg');

    await repo.initDatabase();
    
    services = await repo.fetchServices();
    filteredServices = services;
    emit(ServiceLoaded());
  }

  void searchServices(String query) {
    if (query.isEmpty) {
      filteredServices = services;
    } else {
      filteredServices = services
          .where((service) =>
              service.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(ServiceLoaded());
  }

  void addItemToActivity(int id, int value) {
    repo.updateActivity(value, id);
    initDatabase();
  }
}
