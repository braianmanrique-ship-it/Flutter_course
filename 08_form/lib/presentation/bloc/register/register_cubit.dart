import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form/infraestructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  void onSubmit(BuildContext context) {
    debugPrint(state.name.value);
    debugPrint(state.email.value);
    debugPrint(state.password.value);

    emit(
      state.copyWith(
        formStatus: FormStatus.submitting,
        name: state.name.value,
        email: state.email.value,
        password: state.password.value,

        isValid: Formz.validate([state.name, state.email, state.password]),
      ),
    );

    //dialog de sucess
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Registro exitoso'),
        content: Text(
          'El registro se ha realizado correctamente ${state.name.value} ${state.email.value} ${state.password.value}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void usernameChanged(String value) {
    final username = UsernameInput.dirty(value);
    emit(
      state.copyWith(
        name: username.value,
        isValid: Formz.validate([username, state.email, state.password]),
      ),
    );
  }

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        email: email.value,
        isValid: Formz.validate([email, state.name, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        password: password.value,
        isValid: Formz.validate([password, state.name, state.email]),
      ),
    );
  }
}
