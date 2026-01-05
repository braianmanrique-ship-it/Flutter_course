import 'package:flutter/material.dart';
import 'package:form/presentation/screens/widgets/inputs/text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: _RegisterView(),
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
  String name = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
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
              name = value;
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
              email = value;
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
              password = value;
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
            onPressed: () {
              final isValid = _formkey.currentState!.validate();
              if (!isValid) return;
              print("Capturando datos: $name, $email, $password");
            },
            icon: Icon(Icons.save_alt),
            label: Text('Register'),
          ),
        ],
      ),
    );
  }
}
