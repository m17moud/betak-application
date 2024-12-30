import '../../../../core/api/end_ponits.dart';
import '../../domain/usecases/home_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/home_department_response_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUsecase homeUsecase;

  HomeCubit({required this.homeUsecase}) : super(HomeInitial());

  Future<void> getDepartments() async {
    emit(HomeDepartmentsLoading());
    final failureOrLogin = await homeUsecase.call(const Params(
      pkey: ApiConstants.homePKey,
    ));

    failureOrLogin.fold(
      (failure) => emit(HomeDepartmentsError(message: failure.message)),
      (departmentInfo) =>
          emit(HomeDepartmentsSuccess(departmentInfo: departmentInfo)),
    );
  }
}
