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

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //logo
        const FlutterLogo(size: 100),
        const SizedBox(height: 20),
        CustomTextFormField(
          label: 'Nombre Completo',
          hintText: 'Ingrese su nombre completo',
          prefixIcon: Icons.person,
          onChanged: (value) {
            debugPrint(value);
          },
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          label: 'Email',
          hintText: 'Ingrese su email',
          prefixIcon: Icons.email,
          onChanged: (value) {
            debugPrint(value);
          },
          validator: (value) {
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          label: 'Password',
          hintText: 'Ingrese su password',
          prefixIcon: Icons.password,
          onChanged: (value) {
            debugPrint(value);
          },
          validator: (value) {
            return null;
          },
        ),

        const SizedBox(height: 20),
        FilledButton.tonalIcon(
          onPressed: () {},
          icon: Icon(Icons.save_alt),
          label: Text('Register'),
        ),
      ],
    );
  }
}
