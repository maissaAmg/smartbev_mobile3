import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login/Models/my_user.dart';
import 'package:login/Utils/token_manager.dart';
import 'package:login/View/Widgets/button.dart';
import 'package:login/View/Widgets/info_profil.dart';
import 'package:login/View/modifierprofil_view.dart';
import 'package:flutter/services.dart';
import 'package:login/View/Widgets/menu.dart';
import 'package:login/Services/user_service.dart';
import 'package:login/ViewModels/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:login/Utils/user_manager.dart';

final fontLoader = FontLoader('Helvetica Neue')
  ..addFont(rootBundle.load('assets/fonts/Helvetica Neue Regular.otf'));

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late UserViewModel userViewModel;
  MyUser? myUser;

  //Retrieve user information once the token isn't empty (we are connected)
  @override
  void initState() {
    super.initState();
    userViewModel = Provider.of<UserViewModel>(context, listen: false);
    _getToken();
  }

  Future<void> _getToken() async {
    final token = await TokenManager.getToken();
    if (token != null && token.isNotEmpty) {
      //print(token);
      //print("This is the token from profil {$token}");
      await userViewModel.getUserInfoVM(token);
      setState(() {
        myUser = userViewModel.user;
        print("info user from profil");
        print(myUser?.email);
      });

      // Check if myUser is not null before saving the information
      if (myUser != null) {
        await saveUserInfoManager(
          myUser!.nom,
          myUser!.email,
          myUser!.mdp,
          myUser!.prenom,
          myUser!.sexe,
          myUser!.id,
          myUser!.image,
        );
      }
    }
  }

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
                    image: myUser?.image != null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(myUser!.image),
                          )
                        : const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2016/12/19/21/36/woman-1919143_960_720.jpg'),
                          ),
                  ),
                ),
              ),
              InfoCard(
                user: myUser,
                text: myUser?.image ?? '',
                icon: Icons.lock,
                onPressed: () async {},
              ),

              SizedBox(height: screenHeight * 0.1), // add some space
              SizedBox(
                child: ButtonGlobal(
                  text: "Modifier",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ModifierProfil(),
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
