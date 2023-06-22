class MyUser {
  final int id;
  final String nom;
  final String prenom;
  final String email;
  final String sexe;
  final String mdp;
  final String image;

  MyUser({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.sexe,
    required this.mdp,
    required this.image,
  });

  factory MyUser.fromSharedPreferences(Map<String, dynamic> prefsMap) {
    return MyUser(
      id: prefsMap['id'] ?? -1,
      nom: prefsMap['nom'] ?? '',
      prenom: prefsMap['prenom'] ?? '',
      email: prefsMap['email'] ?? '',
      image: prefsMap['image'] ?? '',
      sexe: prefsMap['sexe'] ?? '',
      mdp: prefsMap['mdp'] ?? '',
    );
  }
}
