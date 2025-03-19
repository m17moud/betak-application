import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_send_otp_state.dart';

class ClientSendOtpCubit extends Cubit<ClientSendOtpState> {
  ClientSendOtpCubit() : super(ClientSendOtpInitial());
}
