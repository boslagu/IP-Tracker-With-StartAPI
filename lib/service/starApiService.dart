import 'package:http/http.dart' as http;
import 'dart:convert';


class StarService {
  static String _url = "http://10.0.2.2:1234/api/v1/user";

  static Future<String> createUserService(String username, String password,
      String name) async {
    var response = await http.post(_url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'name': name,
      }),
    );
    if (response.statusCode == 200) {
      var dbResponse = json.decode(response.body);
      return dbResponse['status'];
    } else {
      print("Something went wrong!.");
      return null;
    }
  }

  static Future<String> signUserService(String username, String password) async {
    var response = await http.post("http://10.0.2.2:1234/api/v1/user/auth/",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      var dbResponse = json.decode(response.body);
      return dbResponse['token'];
    } else {
      print("Something went wrong!.");
      return null;
    }
  }

  static Future<String> locatorService(String domain, String token) async {
    var response = await http.get("http://10.0.2.2:1234/api/v1/ip/" + domain,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
    if (response.statusCode == 200) {
      var dbResponse = json.decode(response.body);
      print(dbResponse);
      return (dbResponse['url']);
    } else {
      print("Something went wrong!.");
      return null;
    }
  }

}