part of 'add_like_cubit.dart';

abstract class AddLikeState extends Equatable {
  const AddLikeState();

  @override
  List<Object> get props => [];
}

class AddLikeInitial extends AddLikeState {}

class AddLikeSuccess extends AddLikeState {}

class AddLikeLoading extends AddLikeState {}

class AddLikeError extends AddLikeState {
  final String message;
  const AddLikeError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class CheckLikeSuccess extends AddLikeState {
  final List<dynamic> checkLikeResponse;

  const CheckLikeSuccess({required this.checkLikeResponse});
  @override
  List<Object> get props => [checkLikeResponse];
}

class CheckLikeLoading extends AddLikeState {}

class CheckLikeError extends AddLikeState {
  final String message;
  const CheckLikeError({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
