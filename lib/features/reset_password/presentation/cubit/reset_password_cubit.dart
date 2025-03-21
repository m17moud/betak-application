import '../../../../core/api/end_ponits.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/string_manager.dart';
import '../../domain/usecases/reset_password_usecase.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase resetPasswordUsecase;
  ResetPasswordCubit({required this.resetPasswordUsecase})
      : super(ResetPasswordInitial());

  Future<void> resetPassword(final String email, final String userType,
      final String newPassword) async {
    FormData formData;
    if (userType == AppStrings.client) {
      formData = FormData.fromMap({
        ApiConstants.pKey: ApiConstants.resetPasswordPKey,
        ApiConstants.tp: ApiConstants.resetPasswordCustomerTP,
        'email': email,
        'npassword': newPassword,
      });
    } else {
      formData = FormData.fromMap({
        ApiConstants.pKey: ApiConstants.resetPasswordPKey,
        ApiConstants.tp: ApiConstants.resetPasswordSellerTP,
        'email': email,
        'npassword': newPassword,
      });
    }
    emit(ResetPasswordLoading());

    final failureOrLogin = await resetPasswordUsecase.call(formData);

    failureOrLogin.fold(
      (failure) {
        if (failure is NetworkFailure) {
          emit(ResetPasswordError(message: failure.message));
        } else {
          emit(const ResetPasswordError(message: AppStrings.errorTryAgain));
        }
      },
      (success) => emit(ResetPasswordSuccess()),
    );
  }
}
