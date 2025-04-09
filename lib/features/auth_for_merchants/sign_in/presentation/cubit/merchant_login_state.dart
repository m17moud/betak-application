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

class MerchantPaymentSuccess extends MerchantLoginState {
  final MerchantPaymentModel paymentURL;

  MerchantPaymentSuccess({required this.paymentURL});
}

class MerchantPaymentLoading extends MerchantLoginState {}

class MerchantPaymentFailure extends MerchantLoginState {
  final String message;

  MerchantPaymentFailure({required this.message});
}

class MerchantPaymentAfterSignUpFailure extends MerchantLoginState {
  final String message;

  MerchantPaymentAfterSignUpFailure({required this.message});
}

class MerchantPaymentNetworkFailure extends MerchantLoginState {
  final String message;

  MerchantPaymentNetworkFailure({required this.message});
}

class MerchantPaymentRequiredFailure extends MerchantLoginState {
  final String message;
  MerchantPaymentRequiredFailure({required this.message});
}
