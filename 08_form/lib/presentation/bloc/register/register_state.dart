part of 'register_cubit.dart';

enum FormStatus { invalid, valid, submitting, success, error, posting }

class RegisterState extends Equatable {
  final FormStatus formStatus;
  final UsernameInput name;
  final EmailInput email;
  final PasswordInput password;
  final bool isValid;

  const RegisterState({
    this.formStatus = FormStatus.invalid,
    this.name = const UsernameInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.isValid = false,
  });

  RegisterState copyWith({
    FormStatus? formStatus,
    String? name,
    String? email,
    String? password,
    bool? isValid,
  }) => RegisterState(
    formStatus: formStatus ?? this.formStatus,
    name: name != null ? UsernameInput.dirty(name) : this.name,
    email: email != null ? EmailInput.dirty(email) : this.email,
    password: password != null ? PasswordInput.dirty(password) : this.password,
    isValid: isValid ?? this.isValid,
  );

  @override
  List<Object> get props => [formStatus, name, email, password, isValid];
}
