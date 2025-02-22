// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'merchant_products_cubit.dart';


abstract class MerchantProductsState extends Equatable {
  const MerchantProductsState();

  @override
  List<Object> get props => [];
}

class MerchantProductsInitial extends MerchantProductsState {}

class MerchantProductsLoading extends MerchantProductsState {}

class MerchantProductsError extends MerchantProductsState {
  final String message;
  const MerchantProductsError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class MerchantProductsSuccess extends MerchantProductsState {
  final List<ProductsModel> departmentProducts;

  const MerchantProductsSuccess({required this.departmentProducts});
  @override
  List<Object> get props => [departmentProducts];
}
class MerchantProductsNoResults extends MerchantProductsState {}
