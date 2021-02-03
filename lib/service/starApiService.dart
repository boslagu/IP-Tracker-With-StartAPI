import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:loginpage/service/responseStructure/userStruct.dart';


class StarService {
  static String _url = "http://192.168.137.70:1234/api/v1/user";
/*"http://10.0.2.2:1234/api/v1/user"*/
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

    print(response.body);
    if (response.statusCode == 201) {
      var dbResponse = json.decode(response.body);
      return dbResponse['status'];
      // return null;aaa
    } else {
      print("Something went wrong!.");
      return null;
    }
  }

  static Future<String> signUserService(String username, String password) async {
    var response = await http.post("http://192.168.137.70:1234/api/v1/user/auth/",
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
    var response = await http.get("http://192.168.137.70:1234/api/v1/ip/" + domain,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
    if (response.statusCode == 200) {
      var dbResponse = json.decode(response.body);
      // List<IPResponse> ipResponse = _parseResponse(response.body);
      var iii = IPResponse.fromJson(json.decode(response.body));
      print(json.decode(response.body));
      print(iii.country);
      // List<IPResponse> ipResponse = _parseResponse(response.body);
      var parsedRespose = IPResponse.fromJson(dbResponse);
      if (json.decode(response.body)['country'] != "" || json.decode(response.body)['city'] != "") {
        print(dbResponse);
        print("Country: ");
        print(parsedRespose.country);
        return response.body;
      }else{
        return null;
      }
      return response.body;
      // return (dbResponse['url']);
    } else {
      print("Something went wrong!.");
      return null;
    }
  }

}