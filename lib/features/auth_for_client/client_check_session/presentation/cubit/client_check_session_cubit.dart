import 'dart:convert';

import 'package:betak/features/auth_for_client/client_check_session/data/models/client_payment_model.dart';
import 'package:betak/features/auth_for_client/client_check_session/domain/usecases/client_payment_usecase.dart';

import '../../../../../core/error/failures.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../sign_in/data/models/customer_login_response_model.dart';
import '../../data/models/client_check_session_response_model.dart';
import '../../domain/usecases/client_check_session_usecase.dart';

part 'client_check_session_state.dart';

class ClientCheckSessionCubit extends Cubit<ClientCheckSessionState> {
  final ClientCheckSessionUsecase checkSessionUsecase;
  final ClientPaymentUsecase clientPaymentUsecase;

  ClientCheckSessionCubit({required this.checkSessionUsecase,required this.clientPaymentUsecase})
      : super(ClientCheckSessionInitial());

  Future<void> clearLocalStorage() async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    await secureStorage.delete(key: Constants.customerSecureStorage);
  }

  Future<void> checkSession() async {
    emit(ClientCheckSessionLoading());
    try {
      FlutterSecureStorage secureStorage = const FlutterSecureStorage();

      String? authJson =
          await secureStorage.read(key: Constants.customerSecureStorage);

      if (authJson != null) {
        final customerData =
            CustomerLoginResponseModel.fromJson(jsonDecode(authJson));
        final failureOrLogin = await checkSessionUsecase.call(
            CheckSessionParameters(
                pkey: ApiConstants.checkSessionPKey,
                tp: ApiConstants.checkSessionCustomerTP,
                id: customerData.CustomerID!,
                sessionId: customerData.sessionid!));
        failureOrLogin.fold(
          (failure) {
            if (failure is NetworkFailure) {
              emit(ClientCheckSessionNetworkFailure(message: failure.message));
            } else if (failure is PaymentRequiredFailure ){
              emit(ClientPaymentRequiredFailure(message: failure.message));

            }

            else {
              emit(ClientCheckSessionFailure(message: failure.message));
            }
          },
          (sessionInfo) =>
              emit(ClientCheckSessionSuccess(message: sessionInfo)),
        );
      } else {
        emit(const ClientCheckSessionFailure(message: AppStrings.error));
      }
    } catch (e) {
      emit(ClientCheckSessionFailure(message: e.toString()));
    }
  }


  Future<void> clientPayment() async {
    emit(ClientPaymentLoading());
    try {
      FlutterSecureStorage secureStorage = const FlutterSecureStorage();

      String? authJson =
      await secureStorage.read(key: Constants.customerSecureStorage);
      if (authJson != null) {
        final customerData =
        CustomerLoginResponseModel.fromJson(jsonDecode(authJson));
        final failureOrLogin = await clientPaymentUsecase.call(
            ClientPaymentParameters(
                pkey: ApiConstants.paymentPKey,
                tp: ApiConstants.paymentCustomerTP,
                email: customerData.CustomerEmail!,));
        failureOrLogin.fold(
              (failure) {
            if (failure is NetworkFailure) {
              emit(ClientPaymentNetworkFailure(message: failure.message));
            }
            else {
              emit(ClientPaymentFailure(message: failure.message));
            }
          },
              (payment) =>
              emit(ClientPaymentSuccess(paymentURL: payment)),
        );
      } else {
        emit(const ClientCheckSessionFailure(message: AppStrings.error));
      }
    } catch (e) {
      emit(ClientCheckSessionFailure(message: e.toString()));
    }
  }
}
