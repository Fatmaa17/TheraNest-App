import 'package:flutter/material.dart';

@immutable
abstract class ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceLoaded extends ServiceState {}

class ServiceEmpty extends ServiceState {}
