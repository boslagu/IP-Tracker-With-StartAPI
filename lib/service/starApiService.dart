import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:loginpage/service/responseStructure/userStruct.dart';


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
      print(response.body);
      return dbResponse['token'];
    }else if(response.statusCode == 401){
      return "Account doesn't exist!.";
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
      // List<IPResponse> ipResponse = _parseResponse(response.body);
      // print(dbResponse);
      return response.body;
      // return (dbResponse['url']);
    } else {
      print("Something went wrong!.");
      return null;
    }
  }

  static List<IPResponse> _parseResponse(String responseBody) {
    // print("_parseResponse: " + responseBody);
    // final parsed = json.decode(responseBody).cast<String, dynamic>();
    // return parsed.map<IPResponse>((json) => IPResponse.fromJson(json)).toList();
  }

}