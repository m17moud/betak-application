// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  String customerId;
  String customerName;
  String customerMobile;
  String customerEmail;
  DateTime customerDate;
  String sessionid;

  CustomerEntity({
    required this.customerId,
    required this.customerName,
    required this.customerMobile,
    required this.customerEmail,
    required this.customerDate,
    required this.sessionid
  });

  @override
  List<Object?> get props =>
      [customerId, customerName, customerMobile, customerEmail, customerDate,sessionid];
}
