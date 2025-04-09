part of 'customer_login_cubit.dart';

@immutable
abstract class CustomerLoginState {}

final class CustomerLoginInitial extends CustomerLoginState {}

class Loading extends CustomerLoginState {}

class LoggedIn extends CustomerLoginState {
  final CustomerLoginResponseModel customerInfo;

  LoggedIn({required this.customerInfo});

  List<Object> get props => [customerInfo];
}

class LoggedOut extends CustomerLoginState {}

class LoginError extends CustomerLoginState {
  final String message;

  LoginError({required this.message});

  List<Object> get props => [message];
}

class ClientPaymentSuccess extends CustomerLoginState {
  final ClientPaymentModel paymentURL;

  ClientPaymentSuccess({required this.paymentURL});
}

class ClientPaymentLoading extends CustomerLoginState {}

class ClientPaymentFailure extends CustomerLoginState {
  final String message;

  ClientPaymentFailure({required this.message});
}
class ClientPaymentAfterSignUpFailure extends CustomerLoginState {
  final String message;

  ClientPaymentAfterSignUpFailure({required this.message});
}


class ClientPaymentNetworkFailure extends CustomerLoginState {
  final String message;

  ClientPaymentNetworkFailure({required this.message});
}

class ClientPaymentRequiredFailure extends CustomerLoginState {
  final String message;

  ClientPaymentRequiredFailure({required this.message});
}
