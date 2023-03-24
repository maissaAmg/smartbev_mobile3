import 'package:flutter/material.dart';
import 'package:login/View/Widgets/info_tache.dart';
import 'package:login/View/Widgets/desc_tache.dart';
import 'package:login/View/Widgets/menu.dart';

const nom = "Amghar";
const prenom = "Maissa";
const email = "jm_amghar@esi.dz"; // not real number :)
const sexe = "Femme";
const tel = "0554094561";
const mdp = "********";

class Tache extends StatelessWidget {
  const Tache({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Menu.buildDrawer(context);
    //final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Menu(
        title: 'Tache 2',
        leftIcon: Icons.arrow_back_ios,
        rightIcon: Icons.menu,
        onLeftIconPressed: () => Navigator.pop(context),
        // ignore: avoid_print
        onRightIconPressed: () => print('Icon menu pressed'),
      ),
      endDrawer: Menu.buildDrawer(context),
      body: SafeArea(
        minimum: EdgeInsets.only(top: screenHeight * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: screenHeight * 0.04),
              const Center(
                child: Text(
                  "Détails",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06,
                ),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.2, color: const Color(0xff222326)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                transform: Matrix4.rotationZ(-0.18 * 3.14159 / 180),
              ),

              // InfoCard(text: mdp, icon: Icons.lock, onPressed: () async {}),
              SizedBox(height: screenHeight * 0.07), // add some space
              InfoTache(
                  text: mdp, icon: Icons.abc_outlined, onPressed: () async {}),
              SizedBox(height: screenHeight * 0.07),
              descTache(
                  text: mdp, icon: Icons.abc_outlined, onPressed: () async {}),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
