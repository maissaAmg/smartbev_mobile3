import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';
import 'package:login/View/Widgets/listenotification.dart';
import 'package:login/View/Widgets/menu.dart';
import 'package:login/View/Widgets/notification_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationList notificationList;

  const NotificationScreen({
    super.key,
    required this.notificationList,
  });

  @override
  Widget build(BuildContext context) {
    Menu.buildDrawer(context);
    return Scaffold(
      backgroundColor: GlobalColor.mainColor,
      appBar: Menu(
        title: 'Notifications',
        leftIcon: Icons.arrow_back_ios,
        rightIcon: Icons.menu,
        onLeftIconPressed: () => Navigator.pop(context),
        // ignore: avoid_print
        onRightIconPressed: () => print('Icon menu pressed'),
      ),
      endDrawer: Menu.buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SvgPicture.asset(
                'assets/images/cloche.svg',
                height: 150,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notificationList.myNotifications.length,
              itemBuilder: (BuildContext context, int index) {
                return NotificationItem(
                  contenu: notificationList.myNotifications[index].contenu,
                  heureOuDate:
                      notificationList.myNotifications[index].heureOuDate,
                  afficher: notificationList.myNotifications[index].afficher,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
