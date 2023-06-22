import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {super.key,
      required this.controller,
      required this.textInputType,
      required this.obscure});
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      alignment: Alignment.center,
      height: 58,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: GlobalColor.textColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
