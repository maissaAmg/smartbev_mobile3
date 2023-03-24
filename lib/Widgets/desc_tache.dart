import 'package:flutter/material.dart';

// our data
const desc =
    "Dépanner le distributeur situé à l’adresse Ecole Nationale Supérieure d'Informatique (ESI ex.INI), Alger, Oued Smar 16309";

// ignore: must_be_immutable, camel_case_types
class descTache extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;
  Function onPressed;

  descTache(
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
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 12, 0),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 11),
                  child: Icon(
                    Icons.auto_stories_outlined,
                    size: 21,
                  ),
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue',
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(35, 15, 35, 30),
            child: Text(
              desc,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFF222326),
                fontFamily: 'Helvetica Neue',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
