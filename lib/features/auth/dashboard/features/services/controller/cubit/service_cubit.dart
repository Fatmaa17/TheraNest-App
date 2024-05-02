import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_state.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/DBRepo.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/service_model/serviceModel.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceLoading()) {
    initDatabase();
  }

  List<ServiceModel> services = [];
  DBRepo repo = DBRepo();

  Future<void> initDatabase() async {
    emit(ServiceLoading());
    await repo.initDatabase();
    await repo.insertServices('Fatima', 'Depression', 500.0, 12, ['En', 'Fr'],
        ["Depression", 'Anxiety']);
    await repo.insertServices('Amany', 'Depression', 666.0, 12, ['En', 'Fr'],
        ["Depression", 'Anxiety']);

    services = await repo.fetchServices();

    if (services.isEmpty) {
      emit(ServiceEmpty());
    } else {
      emit(ServiceLoaded());
    }
  }
}
