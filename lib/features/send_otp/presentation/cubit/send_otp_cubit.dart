import 'package:betak/core/api/end_ponits.dart';
import 'package:betak/core/error/failures.dart';
import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/features/send_otp/domain/usecases/send_otp_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  final SendOtpUsecase sendOtpUsecase;
  SendOtpCubit({required this.sendOtpUsecase}) : super(SendOtpInitial());



  Future<void> sendOTP(
      final String email,
      final String userType
      ) async {
    FormData formData;
    if(userType==AppStrings.cleint) {
       formData = FormData.fromMap({
        ApiConstants.pKey: ApiConstants.sendOTPPKey,
        ApiConstants.tp: ApiConstants.sendOTPCustomerTP,
        'email': email,
      });
    }
    else{
      formData = FormData.fromMap({
        ApiConstants.pKey: ApiConstants.sendOTPPKey,
        ApiConstants.tp: ApiConstants.sendOTPSellerTP,
        'email': email,
      });
    }
    emit(SendOtpLoading());


    final failureOrLogin = await sendOtpUsecase.call(formData);

    failureOrLogin.fold(
          (failure) {
        if (failure is LoginAuthFailure) {
          emit(SendOtpError(message: AppStrings.emailNotFound));
        } else if (failure is NetworkFailure) {
          emit(SendOtpError(message: AppStrings.locNetworkErrorMessage));
        }
        else{
          emit(SendOtpError(message: failure.message));

        }
      },          (success) => emit(SendOtpSuccess()),
    );
  }
}
