part of 'verify_otp_cubit.dart';

abstract class VerifyOtpState extends Equatable {
  const VerifyOtpState();

  @override
  List<Object> get props => [];
}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {}

class VerifyOtpError extends VerifyOtpState {
  final String message;
  const VerifyOtpError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class VerifyOtpInitial extends VerifyOtpState {}
