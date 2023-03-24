import 'package:flutter/material.dart';
import 'package:login/View/Widgets/information.dart';
import 'package:login/View/Widgets/toggle.dart';

// our data
const statut = "100%";
const priorite = "Haute";
const creation = "Dec 1, 2023";
const echeance = "Dec 1, 2023";

// ignore: must_be_immutable
class InfoTache extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;
  Function onPressed;

  InfoTache(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
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
          toggle(text: statut, info: 'Statut', icon: Icons.fact_check_rounded),
          Information(
              text: priorite, info: 'Priorité', icon: Icons.error_rounded),
          Information(
              text: creation,
              info: 'Date de création',
              icon: Icons.today_rounded),
          Information(
              text: echeance,
              info: "Date d'échéance",
              icon: Icons.event_available_rounded),
        ],
      ),
    );
  }
}
