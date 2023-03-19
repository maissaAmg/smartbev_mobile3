import 'package:flutter/material.dart';
import 'package:login/Widgets/button_widget.dart';
import 'package:login/Widgets/container.dart';
import 'package:login/Screens/profil_screen.dart';

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
              child: Image.asset('assets/logo.png'),
            ),
          ),
          const container(), // use the ContainerWidget
          Align(
            alignment: const Alignment(0, 8.5),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 293.0,
                    height: 60.0,
                    child: ButtonWidget(
                      btnText: "Commencer",
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const profil(),
                          ),
                        );
                      },
                    ),
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
