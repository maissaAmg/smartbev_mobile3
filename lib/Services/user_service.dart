import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/Models/my_user.dart';

Future<String> modifyAccount(
    int id,
    String token,
    String email,
    String password,
    String sexe,
    String nom,
    String prenom,
    String role) async {
  print(email);
  print(prenom);
  password = "test";

  final String apiUrl =
      'http://localhost:8000/api/account.management/modifyAccount/$role/$id';

  final response = await http.put(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, dynamic>{
      'mail_utilisateur': email,
      'password_utilisateur': password,
      'sex_utilisateur': sexe,
      'nom_utilisateur': nom,
      'prenom_utilisateur': prenom,
    }),
  );
  print("this is the status code from the service");
  print(response.statusCode);

  if (response.statusCode == 200) {
    return "Account modified succefully";
  } else {
    return 'Failed to modify account: ${response.statusCode}';
  }
}

Future<MyUser?> getUserInfo(String token) async {
  final response = await http.get(
      Uri.parse('http://localhost:8000/api/account.management/getProfil/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      });

  //print(response.body);
  //print(response.statusCode);

  if (response.statusCode == 200) {
    print("successful get user info in");
    final data = jsonDecode(response.body)[
        'data']; //Récupère les informations de la table utilisateur et ceux de la table profil
    final profil =
        data['profil']; //Extrait les informaions de la table profil de data
    print(data);
    print(profil);

    return MyUser(
        id: data['id_utilisateur'],
        nom: profil['nom_utilisateur'],
        prenom: profil['prenom_utilisateur'],
        email: data['mail_utilisateur'],
        sexe: profil['sex_utilisateur'],
        mdp: data['password_utilisateur'],
        image: profil['path_image_utilisateur']);
  } else {
    print('Failed to load user info : ${response.statusCode}');
    throw Exception('Failed to load user info : ${response.statusCode}');
  }
}
