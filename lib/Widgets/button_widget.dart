import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback onPress;

  const ButtonWidget({super.key, required this.btnText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: SizedBox(
        child: Center(
          child: Text(btnText,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFFEBDBCD),
                fontFamily: 'Helvatica Neue',
              )),
        ),
      ),
    );
  }
}
