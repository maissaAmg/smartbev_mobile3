// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:login/Utils/global_colors.dart';
import 'package:login/View/Widgets/textform.dart';
import 'package:login/View/Widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/View/profil_screen.dart';

class ConnexionView extends StatelessWidget {
  const ConnexionView({
    Key? key,
  }) : super(key: key);
  //final TextEditingController emailController = TextEditingController();
  //final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.mainColor,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text('Connexion',
                    style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    )),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/images/connexion.svg',
                  height: 150,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Text('Mail',
                    style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              const SizedBox(height: 10),
              const TextForm(
                //controller: emailController,
                textInputType: TextInputType.emailAddress,
                obscure: false,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Text('Mot de passe',
                    style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              const SizedBox(height: 10),
              const TextForm(
                //controller: passwordController,
                textInputType: TextInputType.text,
                obscure: true,
              ),
              const SizedBox(height: 45),
              ButtonGlobal(
                text: "Se connecter",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profil()));
                },
              ),
              const SizedBox(height: 10),
              Container(
                  alignment: Alignment.center,
                  child: Text.rich(TextSpan(
                      text: 'Mot de passe oublié ? Le restorer ',
                      style: TextStyle(
                        color: GlobalColor.textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'ici',
                          style: TextStyle(
                            color: GlobalColor.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ])))
            ],
          ),
        ),
      )),
    );
  }
}
