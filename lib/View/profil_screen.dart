import 'package:flutter/material.dart';
import 'package:login/View/Widgets/button.dart';
import 'package:login/View/Widgets/info_profil.dart';
import 'package:login/View/modifierprofil_view.dart';
import 'package:flutter/services.dart';
import 'package:login/View/Widgets/menu.dart';

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
    Menu.buildDrawer(context);
    return Scaffold(
      appBar: Menu(
        title: 'Profil',
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 10),
                      ),
                    ],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2016/12/19/21/36/woman-1919143_960_720.jpg'),
                    ),
                  ),
                ),
              ),
              InfoCard(text: mdp, icon: Icons.lock, onPressed: () async {}),
              SizedBox(height: screenHeight * 0.1), // add some space
              SizedBox(
                child: ButtonGlobal(
                  text: "Modifier",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ModifierProfil(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
