import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/presentation/bloc/register/register_cubit.dart';
import 'package:form/presentation/screens/widgets/inputs/text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(children: [_RegisterForm()]),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    final username = registerCubit.state.name;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          //logo
          const FlutterLogo(size: 100),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Nombre Completo',
            hintText: 'Ingrese su nombre completo',
            prefixIcon: Icons.person,
            onChanged: registerCubit.usernameChanged,
            //errores
            errorMessage: username.errorMessage,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Email',
            hintText: 'Ingrese su email',
            prefixIcon: Icons.email,
            onChanged: (value) {
              registerCubit.emailChanged(value);
            },
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Password',
            hintText: 'Ingrese su password',
            prefixIcon: Icons.lock,
            isPassword: true,
            onChanged: (value) {
              registerCubit.passwordChanged(value);
            },
            errorMessage: password.errorMessage,
          ),

          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () async {
              registerCubit.onSubmit(context);
            },
            icon: Icon(Icons.save_alt),
            label: Text('Register'),
          ),
        ],
      ),
    );
  }
}
