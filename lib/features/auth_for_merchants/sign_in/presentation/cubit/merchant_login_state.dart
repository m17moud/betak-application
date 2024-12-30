part of 'merchant_login_cubit.dart';

@immutable
abstract class MerchantLoginState {}

final class MerchantLoginInitial extends MerchantLoginState {}
class Loading extends MerchantLoginState {}

class LoggedIn extends MerchantLoginState {
  final MerchantLoginResponseModel merchantInfo;

   LoggedIn({required this.merchantInfo});

  List<Object> get props => [merchantInfo];
}

class LoggedOut extends MerchantLoginState {}

class LoginError extends MerchantLoginState {
  final String message;

  LoginError({required this.message});

  List<Object> get props => [message];
}