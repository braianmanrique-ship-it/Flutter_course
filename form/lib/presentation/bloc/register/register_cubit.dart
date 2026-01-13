import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/infraestructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  void onSubmit() {
    print(state.name);
    print(state.email);
    print(state.password);
  }

  void usernameChanged(String value) {
    final username = UsernameInput.dirty(value);
    emit(
      state.copyWith(name: username.value, isValid: Formz.validate([username])),
    );
  }

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(state.copyWith(email: email.value, isValid: Formz.validate([email])));
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        password: password.value,
        isValid: Formz.validate([password]),
      ),
    );
  }
}
