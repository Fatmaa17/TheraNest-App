part of 'verification_cubit.dart';

@immutable
sealed class VerificationState {}

final class VerificationInitial extends VerificationState {}
class VerificationSuccess extends VerificationState {}

class VerificationFailure extends VerificationState {}