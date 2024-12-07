import 'package:betak/core/constants/constants.dart';
import 'package:equatable/equatable.dart';



abstract class Failure extends Equatable {
  final String message;

  const Failure({this.message = Constants.locGeneralError});
}

//Gemeral Failures

class ServerFailure extends Failure {
  const ServerFailure({String message = Constants.locServerErrorMessage})
      : super(message: message);
  @override
  List<Object?> get props => [];
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure(
      {String message = Constants.locUnAuthorizedErrorMessage})
      : super(message: message);
  @override
  List<Object?> get props => [];
}

class LoginAuthFailure extends Failure {
  const LoginAuthFailure({String message = Constants.locLoginAuthErrorMessage})
      : super(message: message);
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  const NetworkFailure({String message = Constants.locNetworkErrorMessage})
      : super(message: message);
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
