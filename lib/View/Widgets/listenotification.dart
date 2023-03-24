class MyNotification {
  final String contenu;
  final String heureOuDate;
  final bool afficher;

  MyNotification({
    required this.contenu,
    required this.heureOuDate,
    required this.afficher,
  });
}

class NotificationList {
  final List<MyNotification> myNotifications;

  NotificationList({
    required this.myNotifications,
  });
}
