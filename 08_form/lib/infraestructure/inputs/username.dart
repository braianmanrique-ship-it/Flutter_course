import 'package:formz/formz.dart';

enum UsernameInputError { empty, minLength, maxLength }

class UsernameInput extends FormzInput<String, UsernameInputError> {
  const UsernameInput.pure() : super.pure('');

  const UsernameInput.dirty([super.value = '']) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == UsernameInputError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == UsernameInputError.minLength) {
      return 'El nombre debe tener al menos 3 caracteres';
    }
    if (displayError == UsernameInputError.maxLength) {
      return 'El nombre debe tener menos de 50 caracteres';
    }

    return null;
  }

  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty) {
      return UsernameInputError.empty;
    }
    if (value.length < 3) {
      return UsernameInputError.minLength;
    }
    if (value.length > 50) {
      return UsernameInputError.maxLength;
    }

    return null;
  }
}
