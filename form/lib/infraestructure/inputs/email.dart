import 'package:formz/formz.dart';

enum EmailInputError { empty, invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty([String value = '']) : super.dirty(value);

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
