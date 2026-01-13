import 'package:formz/formz.dart';

enum EmailInputError { empty, invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty([String value = '']) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailInputError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == EmailInputError.invalid) {
      return 'El email no es válido';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'El email no es válido';
    }

    return null;
  }

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) {
      return EmailInputError.empty;
    }
    if (value.length < 3) {
      return EmailInputError.invalid;
    }
    if (!value.contains('@') || !value.contains('.')) {
      return EmailInputError.invalid;
    }

    return null;
  }
}
