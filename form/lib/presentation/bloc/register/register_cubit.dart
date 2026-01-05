import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  void usernameChanged(String value) {}

  void emailChanged(String value) {}

  void passwordChanged(String value) {}

  void register() {}
}
