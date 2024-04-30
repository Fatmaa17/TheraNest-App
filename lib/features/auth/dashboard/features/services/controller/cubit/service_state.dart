part of 'service_cubit.dart';

@immutable
sealed class ServiceState {}

final class ServiceLoading extends ServiceState {}

final class ServiceLoaded extends ServiceState {}

final class ServiceEmpty extends ServiceState {}
