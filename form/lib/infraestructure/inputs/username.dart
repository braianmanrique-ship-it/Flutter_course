import 'package:formz/formz.dart';

enum UsernameInputError { empty, minLength, maxLength }

class UsernameInput extends FormzInput<String, UsernameInputError> {
  const UsernameInput.pure() : super.pure('');

  const UsernameInput.dirty([super.value = '']) : super.dirty();

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
