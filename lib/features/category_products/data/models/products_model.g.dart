// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      id: json['id'] as String?,
      pname: json['pname'] as String?,
      pdescribtion: json['pdescribtion'] as String?,
      pPrice: (json['p_price'] as num?)?.toDouble(),
      departmentid: (json['departmentid'] as num?)?.toInt(),
      sellerid: json['sellerid'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
      shops: json['shops'] as List<dynamic>?,
      likes: (json['likes'] as num?)?.toInt(),
    );

Seller _$SellerFromJson(Map<String, dynamic> json) => Seller(
      sname: json['sname'] as String?,
      semail: json['semail'] as String?,
      saddress: json['saddress'] as String?,
      smobile: json['smobile'] as String?,
      facebookUrl: json['facebook_url'] as String?,
    );
