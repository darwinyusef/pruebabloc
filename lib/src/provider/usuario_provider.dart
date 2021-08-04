import 'dart:convert';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String _urlProyect = 'https://bucappruebav1.herokuapp.com';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(Uri.parse('$_urlProyect/api/user/login'),
        body: json.encode(authData));
    Map<String, dynamic> decResponse = json.decode(resp.body);
    print(decResponse);

    return {'ok': true, 'token': decResponse['idToken']};
    // if (decResponse.containsKey('idToken')) {
    //   _prefs.token = decResponse['idToken'];

    //   return {'ok': true, 'token': decResponse['idToken']};
    // } else {
    //   return {'ok': false, 'mensaje': decResponse['error']['message']};
    // }
  }

  Future<Map<String, dynamic>> register(
      String name, String user, String email, String password, int age) async {
    final authData = {
      'name': name,
      'user': user,
      'email': email,
      'password': password,
      'age': age,
      'returnSecureToken': true
    };

    final resp = await http.post(Uri.parse('$_urlProyect/api/user/register'),
        body: json.encode(authData));
    Map<String, dynamic> decResponse = json.decode(resp.body);

    print(decResponse);

    return {'ok': true, 'token': decResponse['idToken']};
    // if (decResponse.containsKey('idToken')) {
    //   _prefs.token = decResponse['idToken'];

    //   return {'ok': true, 'token': decResponse['idToken']};
    // } else {
    //   return {'ok': false, 'mensaje': decResponse['error']['message']};
    // }
  }
}
