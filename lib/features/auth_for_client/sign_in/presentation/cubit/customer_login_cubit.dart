import 'dart:convert';

import '../../../client_check_session/data/models/client_payment_model.dart';
import '../../../client_check_session/domain/usecases/client_payment_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../data/models/customer_login_response_model.dart';
import '../../domain/usecases/customer_login_usecase.dart';
import '../../domain/usecases/customer_logout_usecase.dart';

part 'customer_login_state.dart';

class CustomerLoginCubit extends Cubit<CustomerLoginState> {
  final CustomerLoginUsecase customerLogin;
  final CustomerLogoutUseCase customerLogout;
  final ClientPaymentUsecase clientPaymentUsecase;

  CustomerLoginCubit(
      {required this.customerLogin,
      required this.customerLogout,
      required this.clientPaymentUsecase})
      : super(CustomerLoginInitial());

  /// Handles user login logic.
  Future<void> login(String email, String password) async {
    emit(Loading());
    final failureOrLogin = await customerLogin.call(Params(
        pkey: ApiConstants.clientSignInPKey,
        loginemail: email,
        loginpassword: password));

    failureOrLogin.fold(
      (failure) {
        if (failure is PaymentRequiredFailure) {
          emit(ClientPaymentRequiredFailure(message: failure.message.tr()));
        } else if (failure is PaymentAfterSignUpRequiredFailure) {
          emit(ClientPaymentAfterSignUpFailure(message: failure.message.tr()));
        } else {
          emit(LoginError(message: failure.message));
        }
      },
      (customerInfo) => emit(LoggedIn(customerInfo: customerInfo)),
    );
  }

  /// Handles user logout logic.
  Future<void> logoutUser() async {
    emit(Loading());
    try {
      FlutterSecureStorage secureStorage = const FlutterSecureStorage();

      String? authJson =
          await secureStorage.read(key: Constants.customerSecureStorage);
      if (authJson != null) {
        final customerData =
            CustomerLoginResponseModel.fromJson(jsonDecode(authJson));

        final result = await customerLogout.call(Parameters(
            pkey: ApiConstants.logoutPKey,
            tp: ApiConstants.logoutCustomerTP,
            id: customerData.CustomerID!));
        if (result != const Left(NetworkFailure())) {
          emit(LoggedOut());
        } else {
          emit(LoginError(message: AppStrings.locNetworkErrorDescription.tr()));
        }
      } else {
        emit(LoginError(message: AppStrings.error.tr()));
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
          customerInfo:
              CustomerLoginResponseModel.fromJson(jsonDecode(authJson)),
        ));
      } else {
        emit(LoggedOut());
      }
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }

  Future<void> clientPayment(String email) async {
    emit(ClientPaymentLoading());

    final failureOrLogin = await clientPaymentUsecase.call(
        ClientPaymentParameters(
            pkey: ApiConstants.paymentPKey,
            tp: ApiConstants.paymentCustomerTP,
            email: email));
    failureOrLogin.fold(
      (failure) {
        if (failure is NetworkFailure) {
          emit(LoginError(message: AppStrings.locNetworkErrorMessage));
        } else {
          emit(ClientPaymentFailure(message: failure.message));
        }
      },
      (payment) => emit(ClientPaymentSuccess(paymentURL: payment)),
    );
  }
}
