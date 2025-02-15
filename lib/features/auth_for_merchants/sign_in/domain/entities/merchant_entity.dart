// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class MerchantEntity extends Equatable {
  String sellerId;
  String sellerName;
  String sellerMobile;
  String sellerEmail;
  String sellerFacebook;
  String sellerProductsType;
  String sellerAddress;
  String sellerDepartmentId;
  DateTime sellerDate;

  MerchantEntity({
    required this.sellerId,
    required this.sellerName,
    required this.sellerMobile,
    required this.sellerEmail,
    required this.sellerFacebook,
    required this.sellerProductsType,
    required this.sellerAddress,
    required this.sellerDate,
    required this.sellerDepartmentId,
  });
  @override
  List<Object?> get props => [
        sellerId,
        sellerName,
        sellerMobile,
        sellerEmail,
        sellerFacebook,
        sellerProductsType,
        sellerAddress,
        sellerDate,
        sellerDepartmentId
      ];
}
