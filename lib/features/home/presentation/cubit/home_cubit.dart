import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/api/end_ponits.dart';
import '../../data/models/home_department_response_model.dart';
import '../../domain/usecases/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUsecase homeUsecase;

  HomeCubit({required this.homeUsecase}) : super(HomeInitial());

  Future<void> getDepartments() async {
    emit(HomeDepartmentsLoading());
    final failureOrLogin = await homeUsecase.call( Params(
      pkey: ApiConstants.homePKey,
    ));

    failureOrLogin.fold(
      (failure) => emit(HomeDepartmentsError(message: failure.message)),
      (departmentInfo) =>
          emit(HomeDepartmentsSuccess(departmentInfo: departmentInfo)),
    );
  }
}
