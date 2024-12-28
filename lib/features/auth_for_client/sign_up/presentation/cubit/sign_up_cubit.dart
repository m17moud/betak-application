
import '../../../../../core/api/end_ponits.dart';
import '../../domain/usecases/add_client_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AddClientUsecase addClientUsecase;

  SignUpCubit({required this.addClientUsecase}) : super(SignUpInitial());

  Future<void> signup(String name, String email, String password, String phone) async {
    FormData formData = FormData.fromMap({
      ApiConstants.pKey: ApiConstants.clientSignUpPKey,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    });

    emit(SignUpLoading());

    final failureOrSignup = await addClientUsecase.call(formData);

    failureOrSignup.fold(
      (failure) => emit(SignUpError(message: failure.message)),
      (success) => emit(SignUpSuccess()),
    );
  }
}



