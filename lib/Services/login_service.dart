import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String?> login(
  String email,
  String password,
) async {
  if (email.isNotEmpty && password.isNotEmpty) {
    var response =
        await http.post(Uri.parse('http://localhost:5000/login/'), body: {
      'email': email,
      'password': password,
      'userRole': 'AM',
      'username': '',
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      var token = data['token'];
      print(token);
      print('succefully logged in');
      return token;
    } else {
      print('unsuccessful logging : ${response.statusCode}');
      return null;
    }
  } else {
    print("vous n'avez pas rempli tous les champs");
    return null;
  }
}
