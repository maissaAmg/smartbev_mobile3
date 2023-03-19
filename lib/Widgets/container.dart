import 'package:flutter/material.dart';

// ignore: camel_case_types
class container extends StatelessWidget {
  const container({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width * 0.85;
    final double height = size.height * 0.45;

    return Positioned(
      top: size.height * 0.31,
      width: size.width,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.rotate(
                angle: -20 * 3.14159 / 180,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBDBCD).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 222, 206, 191),
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                'assets/maa.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
