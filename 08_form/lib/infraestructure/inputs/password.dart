import 'package:formz/formz.dart';

enum PasswordInputError { empty, minLength, maxLength }

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty([super.value = '']) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordInputError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == PasswordInputError.minLength) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    if (displayError == PasswordInputError.maxLength) {
      return 'La contraseña debe tener menos de 100 caracteres';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    if (value.length > 20) {
      return 'La contraseña debe tener menos de 20 caracteres';
    }
    return null;
  }

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) {
      return PasswordInputError.empty;
    } else if (value.length < 6) {
      return PasswordInputError.minLength;
    } else if (value.length > 100) {
      return PasswordInputError.maxLength;
    }

    return null;
  }
}
