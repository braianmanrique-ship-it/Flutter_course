import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final IconData? prefixIcon;
  Function(String)? onChanged;
  final String? Function(String?)? validator;

  CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(50));

    return TextFormField(
      onChanged: (value) {
        debugPrint(value);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El campo es requerido';
        }
        return null;
      },
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
        errorText: null,
      ),
    );
  }
}
