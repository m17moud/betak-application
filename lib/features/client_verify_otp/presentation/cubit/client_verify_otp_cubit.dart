import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_verify_otp_state.dart';

class ClientVerifyOtpCubit extends Cubit<ClientVerifyOtpState> {
  ClientVerifyOtpCubit() : super(ClientVerifyOtpInitial());
}
