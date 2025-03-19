import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_change_password_state.dart';

class ClientChangePasswordCubit extends Cubit<ClientChangePasswordState> {
  ClientChangePasswordCubit() : super(ClientChangePasswordInitial());
}
