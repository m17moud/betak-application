import 'package:betak/features/auth_for_merchants/merhcant_check_session/data/models/merchant_payment_model.dart';
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
class MerchantPaymentRequiredFailure extends MerchantCheckSessionState {
  final String message;

  const MerchantPaymentRequiredFailure({required this.message});
}

class MerchantPaymentSuccess extends MerchantCheckSessionState {
  final MerchantPaymentModel paymentURL;

  const MerchantPaymentSuccess({required this.paymentURL});
}

class MerchantPaymentLoading extends MerchantCheckSessionState {

}
class MerchantPaymentFailure extends MerchantCheckSessionState {
  final String message;

  const MerchantPaymentFailure({required this.message});
}
class MerchantPaymentNetworkFailure extends MerchantCheckSessionState {
  final String message;

  const MerchantPaymentNetworkFailure({required this.message});

}