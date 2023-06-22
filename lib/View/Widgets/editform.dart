// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:login/Utils/global_colors.dart';

// ignore: must_be_immutable
class EditForm extends StatefulWidget {
  bool showPassword = false;
  final String label;
  final String placeholder;
  final bool obscure;
  final TextEditingController controller;
  @override
  State<StatefulWidget> createState() => _EditForm();

  EditForm({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.obscure,
    required this.controller,
  }) : super(key: key);
}

class _EditForm extends State<EditForm> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscure ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: widget.obscure
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ))
                : null,
            labelText: widget.label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: GlobalColor.textColor,
            )),
      ),
    );
  }
}
