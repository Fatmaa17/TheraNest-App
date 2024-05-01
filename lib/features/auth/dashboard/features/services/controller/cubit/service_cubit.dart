import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_state.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/local_db_data.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/serviceModel.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceLoading()) {
    init();
  }

  List<ServiceModel> services = [];

  void init() async {
    emit(ServiceLoading());
    services = await (await DBRepo.instance)!.fetch();
    if (services.isEmpty) {
      emit(ServiceEmpty());
    } else {
      emit(ServiceLoaded(services));
    }
  }
}
