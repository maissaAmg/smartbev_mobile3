import 'package:flutter/material.dart';
import 'package:login/Widgets/button_widget.dart';
import 'package:login/Widgets/info_profil.dart';
import 'package:login/Screens/tache_screen.dart';
import 'package:flutter/services.dart';

final fontLoader = FontLoader('Helvetica Neue')
  ..addFont(rootBundle.load('assets/fonts/Helvetica Neue Regular.otf'));

// our data
const nom = "Amghar";
const prenom = "Maissa";
const email = "jm_amghar@esi.dz"; // not real number :)
const sexe = "Femme";
const tel = "0554094561";
const mdp = "********";

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: screenHeight * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: screenHeight * 0.04),
              const Text(
                "Profil",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Helvetica Neue',
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.1),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.png'),
                  radius: 60,
                ),
              ),
              InfoCard(text: mdp, icon: Icons.lock, onPressed: () async {}),
              SizedBox(height: screenHeight * 0.1), // add some space
              SizedBox(
                width: 293.0,
                height: 60.0,
                child: ButtonWidget(
                  btnText: "Modifier",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tache(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
