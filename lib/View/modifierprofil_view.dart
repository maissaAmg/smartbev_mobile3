// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';
import 'package:login/View/Widgets/button.dart';
import 'package:login/View/Widgets/editform.dart';
import 'package:login/View/Widgets/menu.dart';
import 'package:login/View/Widgets/genreliste.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/View/tache_screen.dart';

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
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://cdn.pixabay.com/photo/2016/12/19/21/36/woman-1919143_960_720.jpg'))),
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
                                placeholder: "Maissa",
                                obscure: false)),
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: EditForm(
                                label: "Nom de famille",
                                placeholder: "Amghar",
                                obscure: false)),
                      ),
                    ],
                  ),
                  EditForm(
                      label: "Email",
                      placeholder: "jm_amghar@esi.dz",
                      obscure: false),
                  EditForm(
                      label: "Numéro de téléphone",
                      placeholder: "0554094561",
                      obscure: false),
                  GenderList(gender: "Homme"),
                  EditForm(
                      label: "Mot de passe",
                      placeholder: "**************",
                      obscure: true),
                  const SizedBox(height: 45),
                  ButtonGlobal(
                    text: "Enregistrer",
                    // ignore: avoid_print
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Tache()));
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
