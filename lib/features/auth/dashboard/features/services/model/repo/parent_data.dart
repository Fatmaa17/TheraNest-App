//abstract to prevent any developer to take any object (useless)
import 'package:therapy_app/features/auth/dashboard/features/services/model/serviceModel.dart';

abstract class ParentRepo {
  Future<void> insert({required String name, String? address});
  Future<List<ServiceModel>> fetch();
  Future<void> delete({required int id});
}
