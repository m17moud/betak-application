part of 'add_product_cubit.dart';

abstract class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

class AddProductLoading extends AddProductState {}

class AddProductSuccess extends AddProductState {}

class AddProductError extends AddProductState {
  final String message;
  const AddProductError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class AddProductInitial extends AddProductState {}
