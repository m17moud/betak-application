import 'package:dio/dio.dart';

import 'error_model.dart';

class LoginAuthException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

//location exceptions
class LocationServiceIsDisabledException implements Exception {}

class LocationPermissionDeniedException implements Exception {}

class LocationPermissionDeniedForeverException implements Exception {}

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});
}

class ConflictException implements Exception {
  final ErrorModel errModel;

  ConflictException({required this.errModel});
}

class GoneException implements Exception {
  final ErrorModel errModel;

  GoneException({required this.errModel});
}

class ServerLoginAuthException implements Exception {
  final ErrorModel errModel;

  ServerLoginAuthException({required this.errModel});
}


class SessionExpiredException implements Exception {
  final ErrorModel errModel;

  SessionExpiredException({required this.errModel});
}

class UnAuthorizedException implements Exception {
  final ErrorModel errModel;

  UnAuthorizedException({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw UnAuthorizedException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw SessionExpiredException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 404: //not found
          throw ServerLoginAuthException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 409: //conflict
          throw ConflictException(
              errModel: ErrorModel.fromJson(e.response!.data));
               case 410: //Deleted
          throw GoneException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 500: //  Unprocessable Entity
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
