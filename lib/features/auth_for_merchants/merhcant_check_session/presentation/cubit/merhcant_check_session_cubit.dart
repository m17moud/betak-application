import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../sign_in/data/models/merchant_login_response_model.dart';
import '../../domain/usecases/merchant_check_session_usecase.dart';
import '../../domain/usecases/merchant_payment_usecase.dart';
import 'merhcant_check_session_state.dart';

class MerchantCheckSessionCubit extends Cubit<MerchantCheckSessionState> {
  final MerchantCheckSessionUsecase checkSessionUsecase;
  final MerchantPaymentUsecase merchantPaymentUsecase;

  MerchantCheckSessionCubit({required this.checkSessionUsecase,required this.merchantPaymentUsecase})
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
                  MerchantCheckSessionNetworkFailure(message: failure.message.tr()));
            }else if (failure is PaymentRequiredFailure ){
              emit(MerchantPaymentRequiredFailure(message: failure.message.tr()));

            } else {
              emit(MerchantCheckSessionFailure(message: failure.message.tr()));
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

  Future<void> merchantPayment() async {
    emit(MerchantPaymentLoading());
    try {
      FlutterSecureStorage secureStorage = const FlutterSecureStorage();

      String? authJson =
      await secureStorage.read(key: Constants.merchantSecureStorage);
      if (authJson != null) {
        final merchantData =
        MerchantLoginResponseModel.fromJson(jsonDecode(authJson));
        final failureOrLogin = await merchantPaymentUsecase.call(
            MerchantPaymentParameters(
              pkey: ApiConstants.paymentPKey,
              tp: ApiConstants.paymentSellerTP,
              email: merchantData.SellerEmail!,));
        failureOrLogin.fold(
              (failure) {
            if (failure is NetworkFailure) {
              emit(MerchantPaymentNetworkFailure(message: failure.message));
            }
            else {
              emit(MerchantPaymentFailure(message: failure.message));
            }
          },
              (payment) =>
              emit(MerchantPaymentSuccess(paymentURL: payment)),
        );
      } else {
        emit(const MerchantCheckSessionFailure(message: AppStrings.error));
      }
    } catch (e) {
      emit(MerchantCheckSessionFailure(message: e.toString()));
    }
  }


}
