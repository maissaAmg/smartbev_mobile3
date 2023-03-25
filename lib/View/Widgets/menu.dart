import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';
import 'package:login/View/profil_screen.dart';
import 'package:login/View/notification_view.dart';
import 'package:login/View/Widgets/listenotification.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/View/listetaches_view.dart';
import 'package:login/View/Widgets/listetaches.dart';

class Menu extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leftIcon;
  final IconData rightIcon;
  final VoidCallback onLeftIconPressed;
  final VoidCallback onRightIconPressed;
  const Menu({
    super.key,
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
    required this.onLeftIconPressed,
    required this.onRightIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColor.mainColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              iconSize: 25.0,
              icon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(leftIcon),
              ),
              onPressed: onLeftIconPressed,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Helvetica Neue',
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              iconSize: 29.0,
              icon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(rightIcon),
              ),
              onPressed: () {
                // Open the drawer
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static Widget buildDrawer(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.4,
      child: Container(
        color: GlobalColor.mainColor.withOpacity(0.9), // darken the background
        child: ListView(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    Image.asset('assets/images/avatar.png',
                        width: 40, height: 40),
                    const SizedBox(width: 15),
                    const Text('Profil',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height:
                              1.2, // equivalent to a line height of 24px for a font size of 20px
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profil()),
                );
              },
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    SvgPicture.asset('assets/images/cloche.svg',
                        width: 40, height: 40),
                    const SizedBox(width: 15),
                    const Text('Notifications',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height:
                              1.2, // equivalent to a line height of 24px for a font size of 20px
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              onTap: () {
                //NEEDS A CHANGE (ici statique)
                NotificationList notificationList =
                    NotificationList(myNotifications: [
                  MyNotification(
                      contenu:
                          'Distributeur à Alger en panne à cause de je ne sais pas je veux juste que la phrase soit longue',
                      heureOuDate: 'il y a 2 heures',
                      afficher: true),
                  MyNotification(
                      contenu: "new", heureOuDate: "new", afficher: true),
                  MyNotification(
                      contenu: "new", heureOuDate: "new", afficher: false),
                  MyNotification(
                      contenu: "new", heureOuDate: "new", afficher: false),
                  MyNotification(
                      contenu: "new", heureOuDate: "new", afficher: false),
                  MyNotification(
                      contenu: "new", heureOuDate: "new", afficher: false),
                  MyNotification(
                      contenu: "new", heureOuDate: "new", afficher: false),
                  MyNotification(
                      contenu: "new", heureOuDate: "new", afficher: false),
                  MyNotification(
                      contenu: "new", heureOuDate: "new", afficher: false),
                  MyNotification(
                      contenu: "new", heureOuDate: "new", afficher: false),
                  MyNotification(
                      contenu: "new", heureOuDate: "new", afficher: false),
                ]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen(
                          notificationList: notificationList)),
                );
              },
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.menu,
                      size: 40,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('Liste des taches',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height:
                              1.2, // equivalent to a line height of 24px for a font size of 20px
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              onTap: () {
                TasksList tasksList = TasksList(myTasks: [
                  MyTask(
                      numTask: 1,
                      contenu: "Dépanner le distributeur numéro",
                      checked: true),
                  MyTask(
                      numTask: 2,
                      contenu: "Dépanner le distributeur numéro",
                      checked: true),
                  MyTask(
                      numTask: 3,
                      contenu: "Dépanner le distributeur numéro",
                      checked: true),
                  MyTask(
                      numTask: 4,
                      contenu: "Dépanner le distributeur numéro",
                      checked: false),
                  MyTask(
                      numTask: 5,
                      contenu: "Dépanner le distributeur numéro",
                      checked: false),
                  MyTask(
                      numTask: 6,
                      contenu: "Dépanner le distributeur numéro",
                      checked: true),
                  MyTask(
                      numTask: 7,
                      contenu: "Dépanner le distributeur numéro",
                      checked: true),
                  MyTask(
                      numTask: 8,
                      contenu: "Dépanner le distributeur numéro",
                      checked: false),
                  MyTask(
                      numTask: 9,
                      contenu: "Dépanner le distributeur numéro",
                      checked: true),
                  MyTask(
                      numTask: 10,
                      contenu: "Dépanner le distributeur numéro",
                      checked: false),
                ]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ListeTacheView(tasksList: tasksList)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
