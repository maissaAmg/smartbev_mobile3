import 'package:flutter/material.dart';

// ignore: camel_case_types
class toggle extends StatefulWidget {
  final String text;
  final String info;
  final IconData icon;
  const toggle({
    super.key,
    required this.text,
    required this.info,
    required this.icon,
  });

  @override
  // ignore: library_private_types_in_public_api
  _toggle createState() => _toggle();
}

// ignore: camel_case_types
class _toggle extends State<toggle> {
  var isEnabled = false;
  final animationDuration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(
                    widget.icon,
                    size: 20,
                  ),
                ),
                Text(
                  widget.info,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 100),
          Text(
            isEnabled ? "100%" : "0%",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Color(0xFF222326),
              fontFamily: 'Helvetica Neue',
            ),
          ),
          Flexible(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEnabled = !isEnabled;
                });
              },
              child: Container(
                height: 23,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isEnabled
                      ? const Color(0xFF249936)
                      : const Color(0xFFEBDBCD),
                  border: Border.all(color: Colors.black, width: 0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: AnimatedAlign(
                  duration: animationDuration,
                  alignment:
                      isEnabled ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Transform.scale(
                      scale:
                          1.3, // adjust this value to increase/decrease the size of the circle
                      child: Container(
                        width: 21,
                        height:
                            21, // set the height and width to the same value to make it a circle
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFEBDBCD),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
