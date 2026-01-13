import 'package:formz/formz.dart';

enum PasswordInputError { empty, minLength, maxLength }

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) {
      return PasswordInputError.empty;
    }
    if (value.length < 3) {
      return PasswordInputError.minLength;
    }
    if (!value.contains('@') || !value.contains('.')) {
      return PasswordInputError.maxLength;
    }

    return null;
  }
}
