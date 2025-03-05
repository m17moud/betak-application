import 'package:equatable/equatable.dart';

import '../../data/models/merchant_check_session_response_model.dart';

abstract class MerchantCheckSessionState extends Equatable {
  const MerchantCheckSessionState();

  @override
  List<Object> get props => [];
}

class MerchantCheckSessionInitial extends MerchantCheckSessionState {}

class MerchantCheckSessionSuccess extends MerchantCheckSessionState {
  final MerchantCheckSessionResponseModel message;

  const MerchantCheckSessionSuccess({required this.message});
}

class MerchantCheckSessionLoading extends MerchantCheckSessionState {}

class MerchantCheckSessionFailure extends MerchantCheckSessionState {
  final String message;

  const MerchantCheckSessionFailure({required this.message});
}

class MerchantCheckSessionNetworkFailure extends MerchantCheckSessionState {
  final String message;

  const MerchantCheckSessionNetworkFailure({required this.message});
}

