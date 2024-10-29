import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {super.key,
      this.controller,
      required this.labelText,
      this.obscure,
      this.validator,
      this.suffixIcon,
      this.keyboardType,
      this.enabled});
  final TextEditingController? controller;
  final String labelText;
  final bool? obscure;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20), 
      child: TextFormField(
        
        validator: validator,
        controller: controller,
        obscureText: obscure ?? false,
        keyboardType: keyboardType,
        enabled: enabled ?? true,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
