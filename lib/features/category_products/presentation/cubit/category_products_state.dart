// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_products_cubit.dart';

abstract class CategoryProductsState extends Equatable {
  const CategoryProductsState();

  @override
  List<Object> get props => [];
}

class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsError extends CategoryProductsState {
  final String message;
  const CategoryProductsError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class CategoryProductsSuccess extends CategoryProductsState {
  final List<ProductsModel> departmentProducts;

  const CategoryProductsSuccess({required this.departmentProducts});
  @override
  List<Object> get props => [departmentProducts];
}
class CategoryProductsNoResults extends CategoryProductsState {}
