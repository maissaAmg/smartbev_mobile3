import 'package:flutter/material.dart';

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
      height: MediaQuery.of(context).size.height * 0.38,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.025,
        top: MediaQuery.of(context).size.height * 0.03,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: const Color(0xFFEBDBCD).withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Prénom:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Maissa",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0.5,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Nom:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Amghar",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0.5,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Email:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "jm_amghar@esi.dz",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0.5,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Sexe:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Femme",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0.5,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Téléphone:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "0554657870",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
