// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:login/Widgets/info_card.dart';

// our data
const nom = "Amghar";
const prenom = "Maissa";
const email = "jm_amghar@esi.dz"; // not real number :)
const sexe = "Femme";
const tel = "0554094561";
const mdp = "********";

class profil extends StatelessWidget {
  const profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
              const Text(
                "Shivansh Singh",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey[200],
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Source Sans Pro"),
              ),
              const SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              // we will be creating a new widget name info carrd

              InfoCard(text: nom, icon: Icons.person, onPressed: () async {}),
              InfoCard(
                  text: prenom, icon: Icons.person, onPressed: () async {}),
              InfoCard(text: email, icon: Icons.email, onPressed: () async {}),
              InfoCard(text: sexe, icon: Icons.wc, onPressed: () async {}),
              InfoCard(text: tel, icon: Icons.phone, onPressed: () async {}),
              InfoCard(text: mdp, icon: Icons.password, onPressed: () async {})
            ],
          ),
        ));
  }
}
