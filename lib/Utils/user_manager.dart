import 'package:shared_preferences/shared_preferences.dart';

// Store user information in shared preferences
Future<void> saveUserInfoManager(String nom, String email, String mdp,
    String prenom, String sexe, int id, String image) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('id', id);
  prefs.setString('nom', nom);
  prefs.setString('prenom', prenom);
  prefs.setString('sexe', sexe);
  prefs.setString('email', email);
  prefs.setString('mdp', mdp);
  prefs.setString('image', image);
}

// Retrieve user information from shared preferences
Future<Map<String, dynamic>> getUserInfoManager() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int id = prefs.getInt('id') ?? -1;
  String nom = prefs.getString('nom') ?? '';
  String prenom = prefs.getString('prenom') ?? '';
  String email = prefs.getString('email') ?? '';
  String image = prefs.getString('image') ?? '';
  String sexe = prefs.getString('sexe') ?? '';
  String mdp = prefs.getString('mdp') ?? '';
  return {
    'id': id,
    'nom': nom,
    'prenom': prenom,
    'email': email,
    'mdp': mdp,
    'sexe': sexe,
    'image': image
  };
}

// Delete user information from shared preferences
Future<void> deleteUserInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('id');
  prefs.remove('sexe');
  prefs.remove('nom');
  prefs.remove('prenom');
  prefs.remove('email');
  prefs.remove('mdp');
  prefs.remove('image');
}
