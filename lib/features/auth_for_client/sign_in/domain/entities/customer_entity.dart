import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable{
  String customerId;
  String customerName;
  String customerMobile;
  String customerEmail;
  DateTime customerDate;

  CustomerEntity({
    required this.customerId,
    required this.customerName,
    required this.customerMobile,
    required this.customerEmail,
    required this.customerDate,
  });

  @override
  List<Object?> get props => [customerId, customerName, customerMobile, customerEmail, customerDate];
}



