import 'package:flutter/material.dart';

import 'package:login/View/Widgets/button.dart';
import 'package:login/View/Widgets/container.dart';
import 'package:login/View/connexion_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 67,
            left: 0,
            right: 0,
            child: SizedBox(
              width: 292,
              height: 116,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          const container(), // use the ContainerWidget
          Align(
            alignment: const Alignment(0, 8.5),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonGlobal(
                    text: "Commencer",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConnexionView()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
