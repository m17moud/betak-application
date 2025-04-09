import 'package:equatable/equatable.dart';

import '../utils/string_manager.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({this.message = AppStrings.locGeneralError});
}

//General Failures

class ServerFailure extends Failure {
  const ServerFailure({super.message = AppStrings.locServerErrorMessage});
  @override
  List<Object?> get props => [];
}

class SessionExpiredFailure extends Failure {
  const SessionExpiredFailure(
      {super.message = AppStrings.locSessionErrorMessage});
  @override
  List<Object?> get props => [];
}

class GoneFailure extends Failure {
  const GoneFailure({super.message = AppStrings.locGoneMessage});
  @override
  List<Object?> get props => [];
}

class ConflictFailure extends Failure {
  const ConflictFailure({super.message = AppStrings.locConflictMessage});
  @override
  List<Object?> get props => [];
}

class PaymentAfterSignUpRequiredFailure extends Failure {
  const PaymentAfterSignUpRequiredFailure(
      {super.message = AppStrings.locPaymentAfterSignUpRequiredMessage});
  @override
  List<Object?> get props => [];
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure(
      {super.message = AppStrings.locUnAuthorizedErrorMessage});
  @override
  List<Object?> get props => [];
}

class PaymentRequiredFailure extends Failure {
  const PaymentRequiredFailure(
      {super.message = AppStrings.paymentRequiredMessage});
  @override
  List<Object?> get props => [];
}

class LoginAuthFailure extends Failure {
  const LoginAuthFailure({super.message = AppStrings.locLoginAuthErrorMessage});
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = AppStrings.locNetworkErrorMessage});
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnimplementedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

//location failures
class LocationFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LocationPermissionDeniedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LocationServiceDisabledFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LocationPermissionDeniedForeverFailure extends Failure {
  @override
  List<Object?> get props => [];
}

//pick image failures
class PickImageFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CompressImageFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UpdateFailure extends Failure {
  @override
  List<Object?> get props => [];
}
