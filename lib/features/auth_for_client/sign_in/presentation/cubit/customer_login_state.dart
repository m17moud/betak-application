part of 'customer_login_cubit.dart';

@immutable
abstract class CustomerLoginState {}

final class CustomerLoginInitial extends CustomerLoginState {}
class Loading extends CustomerLoginState {}

class LoggedIn extends CustomerLoginState {
  final CustomerLoginResponseModel customerInfo;

   LoggedIn({required this.customerInfo});

  @override
  List<Object> get props => [customerInfo];
}

class LoggedOut extends CustomerLoginState {}

class LoginError extends CustomerLoginState {
  final String message;

  LoginError({required this.message});

  @override
  List<Object> get props => [message];
}