import 'package:flutter/material.dart';
import 'package:login/Widgets/button_widget.dart';
import 'package:login/Widgets/info_card.dart';

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
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 70),
        child: Column(
          children: <Widget>[
            const Text(
              "Profil",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),
                radius: 60,
              ),
            ),
            InfoCard(text: nom, icon: Icons.person, onPressed: () async {}),
            const SizedBox(height: 110), // add some space
            SizedBox(
              width: 293.0,
              height: 60.0,
              child: ButtonWidget(
                btnText: "Modifier",
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profil(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
