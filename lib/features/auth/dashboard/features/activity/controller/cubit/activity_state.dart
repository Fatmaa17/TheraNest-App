import 'package:flutter/material.dart';

@immutable
abstract class activityState {}

class activityLoading extends activityState {}

class activityLoaded extends activityState {}

class activityEmpty extends activityState {}
