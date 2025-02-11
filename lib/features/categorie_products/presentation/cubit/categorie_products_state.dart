// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'categorie_products_cubit.dart';

abstract class CategorieProductsState extends Equatable {
  const CategorieProductsState();

  @override
  List<Object> get props => [];
}

class CategorieProductsInitial extends CategorieProductsState {}

class CategorieProductsLoading extends CategorieProductsState {}

class CategorieProductsError extends CategorieProductsState {
  final String message;
  const CategorieProductsError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class CategorieProductsSuccess extends CategorieProductsState {
  final List<ProductsModel> departmentProducts;

  const CategorieProductsSuccess({required this.departmentProducts});
  @override
  List<Object> get props => [departmentProducts];
}
class CategorieProductsNoResults extends CategorieProductsState {}
