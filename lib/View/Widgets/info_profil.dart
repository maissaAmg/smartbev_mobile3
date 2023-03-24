import 'package:flutter/material.dart';
import 'package:login/View/Widgets/information.dart';

// our data
const nom = "Amghar";
const prenom = "Maissa";
const email = "jm_amghar@esi.dz";
const sexe = "Femme";
const tel = "0554094561";

// ignore: must_be_immutable
class InfoCard extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.025,
        top: MediaQuery.of(context).size.height * 0.03,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEBDBCD),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Information(text: prenom, info: 'Prénom', icon: Icons.info_outline),
          Divider(
            height: 0.5,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Information(text: nom, info: 'Nom', icon: Icons.info_outline),
          Divider(
            height: 0.5,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Information(text: email, info: 'Email', icon: Icons.info_outline),
          Divider(
            height: 0.5,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Information(text: sexe, info: 'Sexe', icon: Icons.info_outline),
          Divider(
            height: 0.5,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Information(text: tel, info: 'Téléphone', icon: Icons.info_outline),
        ],
      ),
    );
  }
}
