// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:login/Models/my_user.dart';
import 'package:login/Utils/global_colors.dart';
import 'package:login/Utils/token_manager.dart';
import 'package:login/Utils/user_manager.dart';
import 'package:login/View/Widgets/button.dart';
import 'package:login/View/Widgets/editform.dart';
import 'package:login/View/Widgets/menu.dart';
import 'package:login/View/Widgets/genreliste.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/View/profil_screen.dart';
import 'package:login/View/tache_screen.dart';
import 'package:login/Services/user_service.dart';

var user = MyUser(
    id: -1,
    nom: "",
    prenom: "",
    email: "",
    sexe: "",
    mdp: "",
    image:
        "https://cdn.pixabay.com/photo/2016/12/19/21/36/woman-1919143_960_720.jpg");

var _token = "";
var _id = -1;
var _nom = "";
var _prenom = "";
var _email = "";
var _sexe = "";
var _mdp = "";
var _image = "";

class ModifierProfil extends StatefulWidget {
  const ModifierProfil({super.key});

  @override
  State<ModifierProfil> createState() => _ModifierProfilState();
}

class _ModifierProfilState extends State<ModifierProfil> {
  final picker = ImagePicker();
  Future getImage(source) async {
    final image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }

    setState(() {});
  }

  //récupérer le nouveau sexe choisi par l'utilisateur
  void onGenderChanged(String newGender) {
    setState(() {
      _sexe = newGender;
    });
  }

  final TextEditingController prenomController = TextEditingController();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mdpController = TextEditingController();

  Future<void> _getToken() async {
    final token = await TokenManager.getToken();
    if (token != null && token.isNotEmpty) {
      _token = token;
    }
  }

  Future<void> _getUserInfo() async {
    final prefsMap = await getUserInfoManager();
    setState(() {
      user = MyUser.fromSharedPreferences(prefsMap);
      _id = user.id;
      _nom = user.nom;
      _prenom = user.prenom;
      _email = user.email;
      _sexe = user.sexe;
      _mdp = user.mdp;
      _image = user.image;
    });
  }

  @override
  void initState() {
    super.initState();
    _getToken();
    _getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    Menu.buildDrawer(context);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: GlobalColor.mainColor,
        appBar: Menu(
          title: 'Profil',
          leftIcon: Icons.arrow_back_ios,
          rightIcon: Icons.menu,
          onLeftIconPressed: () => Navigator.pop(context),
          // ignore: avoid_print
          onRightIconPressed: () => print('Icon menu pressed'),
        ),
        endDrawer: Menu.buildDrawer(context),
        body: Container(
            padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Center(
                    child: Stack(
                      children: [
                        Container(
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
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(user.image))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: GlobalColor.mainColor,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  )),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: ((builder) =>
                                          bottomProfilePicture()));
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: EditForm(
                                label: "Prénom",
                                placeholder: user.prenom,
                                controller: prenomController,
                                obscure: false)),
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: EditForm(
                                label: "Nom de famille",
                                placeholder: user.nom,
                                controller: nomController,
                                obscure: false)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditForm(
                      label: "Email",
                      placeholder: user.email,
                      controller: emailController,
                      obscure: false),
                  const SizedBox(
                    height: 15,
                  ),
                  GenderList(
                    gender: user.sexe,
                    onChanged: onGenderChanged,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EditForm(
                      label: "Mot de passe",
                      placeholder: "",
                      controller: mdpController,
                      obscure: true),
                  const SizedBox(height: 50),
                  ButtonGlobal(
                    text: "Enregistrer",

                    // ignore: avoid_print
                    onPressed: () async {
                      if (emailController.text.isNotEmpty) {
                        _email = emailController.text;
                      }
                      if (mdpController.text.isNotEmpty) {
                        _mdp = mdpController.text;
                      }
                      if (nomController.text.isNotEmpty) {
                        _nom = nomController.text;
                      }
                      if (prenomController.text.isNotEmpty) {
                        _prenom = prenomController.text;
                      }

                      await modifyAccount(
                        _id,
                        _token,
                        _email,
                        _mdp,
                        _sexe,
                        _nom,
                        _prenom,
                        'AM',
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profil()),
                      );
                    },
                  )
                ],
              ),
            )));
  }

  Widget bottomProfilePicture() {
    return Container(
      height: 30.0,
      padding: const EdgeInsets.only(right: 50, left: 40),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
              onPressed: () {
                getImage(ImageSource.camera);
              },
              icon: Icon(
                Icons.camera,
                color: GlobalColor.buttonColor,
                size: 22,
              ),
              label: Text(
                "Caméra",
                style: TextStyle(color: GlobalColor.buttonColor),
              )),
          TextButton.icon(
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              icon: Icon(
                Icons.image,
                color: GlobalColor.buttonColor,
                size: 22,
              ),
              label: Text(
                "Galerie",
                style: TextStyle(
                  color: GlobalColor.buttonColor,
                ),
              )),
        ],
      ),
    );
  }
}
