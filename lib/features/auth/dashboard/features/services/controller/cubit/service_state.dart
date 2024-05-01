import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/serviceModel.dart';

@immutable
abstract class ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceLoaded extends ServiceState {
  final List<ServiceModel> services;

  ServiceLoaded(this.services);
}

class ServiceEmpty extends ServiceState {}
