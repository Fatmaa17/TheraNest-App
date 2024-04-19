part of 'onboarding_controller_cubit.dart';

@immutable
sealed class OnboardingControllerState {}

final class OnboardingControllerInitial extends OnboardingControllerState {}
final class OnboardingPageChange extends OnboardingControllerState {}
