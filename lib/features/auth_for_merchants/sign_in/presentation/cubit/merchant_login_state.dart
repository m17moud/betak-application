part of 'merchant_login_cubit.dart';

@immutable
abstract class MerchantLoginState {}

final class MerchantLoginInitial extends MerchantLoginState {}
class Loading extends MerchantLoginState {}

class MerchantLoggedIn extends MerchantLoginState {
  final MerchantLoginResponseModel merchantInfo;

   MerchantLoggedIn({required this.merchantInfo});

  List<Object> get props => [merchantInfo];
}

class MerchantLoggedOut extends MerchantLoginState {}

class MerchantLoginError extends MerchantLoginState {
  final String message;

  MerchantLoginError({required this.message});

  List<Object> get props => [message];
}