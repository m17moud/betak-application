part of 'client_check_session_cubit.dart';

abstract class ClientCheckSessionState extends Equatable {
  const ClientCheckSessionState();

  @override
  List<Object> get props => [];
}

class ClientCheckSessionInitial extends ClientCheckSessionState {}

class ClientCheckSessionSuccess extends ClientCheckSessionState {
  final ClientCheckSessionResponseModel message;

  const ClientCheckSessionSuccess({required this.message});
}

class ClientCheckSessionLoading extends ClientCheckSessionState {}

class ClientCheckSessionFailure extends ClientCheckSessionState {
  final String message;

  const ClientCheckSessionFailure({required this.message});
}
class ClientPaymentRequiredFailure extends ClientCheckSessionState {
  final String message;

  const ClientPaymentRequiredFailure({required this.message});
}

class ClientCheckSessionNetworkFailure extends ClientCheckSessionState {
  final String message;

  const ClientCheckSessionNetworkFailure({required this.message});

}

class ClientPaymentSuccess extends ClientCheckSessionState {
  final ClientPaymentModel paymentURL;

  const ClientPaymentSuccess({required this.paymentURL});
}

class ClientPaymentLoading extends ClientCheckSessionState {

}
class ClientPaymentFailure extends ClientCheckSessionState {
  final String message;

  const ClientPaymentFailure({required this.message});
}
class ClientPaymentNetworkFailure extends ClientCheckSessionState {
  final String message;

  const ClientPaymentNetworkFailure({required this.message});

}