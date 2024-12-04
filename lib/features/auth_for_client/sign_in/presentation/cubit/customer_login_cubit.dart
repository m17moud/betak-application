
import 'dart:convert';
import 'package:betak/core/api/end_ponits.dart';
import 'package:betak/core/constants/constants.dart';
import 'package:betak/core/error/failures.dart';
import 'package:betak/core/usecases/usecase.dart';
import 'package:betak/features/auth_for_client/sign_in/domain/usecases/customer_login_usecase.dart';
import 'package:betak/features/auth_for_client/sign_in/domain/usecases/customer_logout_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:betak/features/auth_for_client/sign_in/data/models/customer_login_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


part 'customer_login_state.dart';


class CustomerLoginCubit extends Cubit<CustomerLoginState> {
  final CustomerLoginUsecase customerLogin;
  final CustomerLogoutUseCase customerLogout;


  CustomerLoginCubit({required this.customerLogin,required this.customerLogout})
      : super(CustomerLoginInitial());

  /// Handles user login logic.
  Future<void> login(String email, String password) async {
    emit(Loading());
    final failureOrLogin =
    await customerLogin.call(Params(pkey: ApiConstants.clientSignInPKey,loginemail: email,loginpassword: password));

    failureOrLogin.fold(
          (failure) => emit(LoginError(message: failure.errMessage)),
          (customerInfo) => emit(LoggedIn(customerInfo: customerInfo)),
    );
  }

  /// Handles user logout logic.
  Future<void> logoutUser() async {
    emit(Loading());
    try {
      final result = await customerLogout.call(NoParams());
      if (result != Left(NetworkFailure())) {
        emit(LoggedOut());
      }
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }


  /// Checks if the user is already authenticated.
  Future<void> checkAuthStatus() async {
    emit(Loading());
    try {
      FlutterSecureStorage secureStorage = const FlutterSecureStorage();

      String? authJson =
      await secureStorage.read(key: Constants.customerSecureStorage);

      if (authJson != null) {
        emit(LoggedIn(
          customerInfo: CustomerLoginResponseModel.fromJson(jsonDecode(authJson)),
        ));
      } else {
        emit(LoggedOut());
      }
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }
}
