part of 'send_otp_cubit.dart';

abstract class SendOtpState extends Equatable {
  const SendOtpState();

  @override
  List<Object> get props => [];
}
class SendOtpLoading extends SendOtpState {}

class SendOtpSuccess extends SendOtpState {}

class SendOtpError extends SendOtpState {
  final String message;
  const SendOtpError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class SendOtpInitial extends SendOtpState {}
