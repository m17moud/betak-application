part of 'manage_product_cubit.dart';


abstract class ManageProductState extends Equatable {
  const ManageProductState();

  @override
  List<Object> get props => [];
}

class UpdateProductLoading extends ManageProductState {}

class UpdateProductSuccess extends ManageProductState {}

class UpdateProductError extends ManageProductState {
  final String message;
  const UpdateProductError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class UpdateProductInitial extends ManageProductState {}


class DeleteProductLoading extends ManageProductState {}

class DeleteProductSuccess extends ManageProductState {}

class DeleteProductError extends ManageProductState {
  final String message;
  const DeleteProductError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class DeleteProductInitial extends ManageProductState {}

