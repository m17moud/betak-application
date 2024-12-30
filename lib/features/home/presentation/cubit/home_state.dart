// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeDepartmentsLoading extends HomeState {}

class HomeDepartmentsError extends HomeState {
  final String message;
  const HomeDepartmentsError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class HomeDepartmentsSuccess extends HomeState {
  final List<HomeDepartmentResponseModel> departmentInfo;

  const HomeDepartmentsSuccess({required this.departmentInfo});
  @override
  List<Object> get props => [departmentInfo];
}
