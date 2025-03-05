import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../sign_in/data/models/merchant_login_response_model.dart';
import '../../domain/usecases/merchant_check_session_usecase.dart';
import 'merhcant_check_session_state.dart';

class MerchantCheckSessionCubit extends Cubit<MerchantCheckSessionState> {
  final MerchantCheckSessionUsecase checkSessionUsecase;

  MerchantCheckSessionCubit({required this.checkSessionUsecase})
      : super(MerchantCheckSessionInitial());

  Future<void> clearLocalStorage() async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    await secureStorage.delete(key: Constants.merchantSecureStorage);
  }

  Future<void> checkSession() async {
    emit(MerchantCheckSessionLoading());
    try {
      FlutterSecureStorage secureStorage = const FlutterSecureStorage();

      String? authJson =
          await secureStorage.read(key: Constants.merchantSecureStorage);

      if (authJson != null) {
        final merhcantData =
            MerchantLoginResponseModel.fromJson(jsonDecode(authJson));
        final failureOrLogin = await checkSessionUsecase.call(
            CheckSessionParameters(
                pkey: ApiConstants.checkSessionPKey,
                tp: ApiConstants.checkSessionSellerTP,
                id: merhcantData.SellerID!,
                sessionId: merhcantData.sessionid!));
        failureOrLogin.fold(
          (failure) {
            if (failure is NetworkFailure) {
              emit(
                  MerchantCheckSessionNetworkFailure(message: failure.message));
            } else {
              emit(MerchantCheckSessionFailure(message: failure.message));
            }
          },
          (sessionInfo) =>
              emit(MerchantCheckSessionSuccess(message: sessionInfo)),
        );
      } else {
        emit(const MerchantCheckSessionFailure(message: AppStrings.error));
      }
    } catch (e) {
      emit(MerchantCheckSessionFailure(message: e.toString()));
    }
  }
}
