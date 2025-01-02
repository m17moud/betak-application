// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'merchant_sign_up_cubit.dart';

abstract class MerchantSignUpState extends Equatable {
  const MerchantSignUpState();

  @override
  List<Object> get props => [];
}

class MerchantSignUpLoading extends MerchantSignUpState {}

class MerchantSignUpSuccess extends MerchantSignUpState {}

class MerchantSignUpError extends MerchantSignUpState {
  final String message;
  const MerchantSignUpError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class MerchantSignUpInitial extends MerchantSignUpState {}
