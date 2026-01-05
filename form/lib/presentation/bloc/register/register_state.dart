part of 'register_cubit.dart';

enum FormStatus { invalid, valid, submitting, success, error, posting }

class RegisterState extends Equatable {
  final FormStatus formStatus;
  final String name;
  final String email;
  final String password;

  const RegisterState({
    this.formStatus = FormStatus.invalid,
    this.name = '',
    this.email = '',
    this.password = '',
  });

  RegisterState copyWith({
    FormStatus? formStatus,
    String? name,
    String? email,
    String? password,
  }) => copyWith(
    formStatus: formStatus ?? this.formStatus,
    name: name,
    email: email,
    password: password,
  );

  @override
  List<Object> get props => [formStatus, name, email, password];
}
