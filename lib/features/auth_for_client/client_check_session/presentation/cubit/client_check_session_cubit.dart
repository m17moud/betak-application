import 'dart:convert';

import 'package:betak/core/constants/constants.dart';
import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/features/auth_for_client/client_check_session/data/models/client_check_session_response_model.dart';
import 'package:betak/features/auth_for_client/client_check_session/domain/usecases/client_check_session_usecase.dart';
import 'package:betak/features/auth_for_client/sign_in/data/models/customer_login_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../core/api/end_ponits.dart';

part 'client_check_session_state.dart';

class ClientCheckSessionCubit extends Cubit<ClientCheckSessionState> {
  final ClientCheckSessionUsecase checkSessionUsecase;

  ClientCheckSessionCubit({required this.checkSessionUsecase})
      : super(ClientCheckSessionInitial());
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
          (failure) =>
              emit(ClientCheckSessionFailure(message: failure.message)),
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
}
