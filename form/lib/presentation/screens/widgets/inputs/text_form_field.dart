import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;
  final String? errorMessage;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    required this.onChanged,
    this.validator,
    this.isPassword = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(50));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        isDense: true,
        label: Text(label ?? ''),
        hintText: hintText ?? '',
        prefixIcon: Icon(prefixIcon ?? Icons.email),
        //error
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        errorText: errorMessage,
      ),
    );
  }
}
