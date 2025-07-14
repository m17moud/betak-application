import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/api/end_ponits.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/string_manager.dart';
import '../../domain/usecases/verify_otp_usecase.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpUsecase verifyOtpUsecase;
  VerifyOtpCubit({required this.verifyOtpUsecase}) : super(VerifyOtpInitial());

  Future<void> verifyOtp(
      final String email, final String userType, final int otp) async {
    FormData formData;
    if (userType == AppStrings.client) {
      formData = FormData.fromMap({
        ApiConstants.pKey: ApiConstants.verifyOTPPKey,
        ApiConstants.tp: ApiConstants.verifyOTPCustomerTP,
        'email': email,
        'otp': otp,
      });
    } else {
      formData = FormData.fromMap({
        ApiConstants.pKey: ApiConstants.verifyOTPPKey,
        ApiConstants.tp: ApiConstants.verifyOTPSellerTP,
        'email': email,
        'otp': otp,
      });
    }
    emit(VerifyOtpLoading());

    final failureOrLogin = await verifyOtpUsecase.call(formData);

    failureOrLogin.fold(
      (failure) {
        if (failure is UnAuthorizedFailure) {
          emit(VerifyOtpError(message: AppStrings.wrongOtp.tr()));
        } else {
          emit(VerifyOtpError(message: failure.message));
        }
      },
      (success) => emit(VerifyOtpSuccess()),
    );
  }
}
