import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';

class ButtonGlobal extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const ButtonGlobal({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 40, left: 40),
      child: InkWell(
        onTap: onPressed,
        child: Container(
            alignment: Alignment.center,
            height: 58,
            decoration: BoxDecoration(
                color: GlobalColor.buttonColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 3,
                  )
                ]),
            child: Text(text,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFEBDBCD),
                  fontFamily: 'Helvatica Neue',
                ))),
      ),
    );
  }
}
