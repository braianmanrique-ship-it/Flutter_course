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

class _RegisterForm extends StatefulWidget {
  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formkey,
      child: Column(
        children: [
          //logo
          const FlutterLogo(size: 100),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Nombre Completo',
            hintText: 'Ingrese su nombre completo',
            prefixIcon: Icons.person,
            onChanged: (value) {
              registerCubit.usernameChanged(value);
              _formkey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El campo es requerido';
              }
              if (value.length < 3) {
                return 'El nombre debe tener al menos 3 caracteres';
              }
              if (value.length > 50) {
                return 'El nombre debe tener menos de 50 caracteres';
              }

              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Email',
            hintText: 'Ingrese su email',
            prefixIcon: Icons.email,
            onChanged: (value) {
              registerCubit.emailChanged(value);
              _formkey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El campo es requerido';
              }
              if (!value.contains('@') || !value.contains('.')) {
                return 'El email no es válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Password',
            hintText: 'Ingrese su password',
            prefixIcon: Icons.lock,
            isPassword: true,
            onChanged: (value) {
              registerCubit.passwordChanged(value);
              _formkey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El campo es requerido';
              }
              if (value.length < 8) {
                return 'La contraseña debe tener al menos 8 caracteres';
              }
              return null;
            },
          ),

          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () async {
              registerCubit.onSubmit();
            },
            icon: Icon(Icons.save_alt),
            label: Text('Register'),
          ),
        ],
      ),
    );
  }
}
