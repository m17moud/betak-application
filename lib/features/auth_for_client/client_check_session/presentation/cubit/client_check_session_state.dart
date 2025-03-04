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
