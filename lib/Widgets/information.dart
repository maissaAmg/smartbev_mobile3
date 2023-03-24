import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Information extends StatelessWidget {
  // the values we need
  final String text;
  final String info;
  final IconData icon;
  //Function onPressed;

  const Information({
    super.key,
    required this.text,
    required this.info,
    required this.icon,

    //required this.onPressed
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth > 600 ? 20.0 : 16.0;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(icon, size: 18),
                ),
                Text(
                  info,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF222326),
                    fontFamily: 'Helvetica Neue',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            flex: 0,
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
