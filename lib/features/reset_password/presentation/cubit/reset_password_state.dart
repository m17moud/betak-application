part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  final String message;
  const ResetPasswordError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class ResetPasswordInitial extends ResetPasswordState {}
