import 'package:http/http.dart' as http;
import 'package:loginpage/service/responseStructure/githubResponseStructure.dart';
import 'dart:convert';

import 'package:loginpage/service/responseStructure/userStruct.dart';


class GithubAPI{
  static String url = "https://api.github.com/users/";

  static Future<GithubResponseStructure> getUser(String username) async{
    print(url+username);
    var jsonResponse = await http.get(url + username);


    if (jsonResponse.statusCode == 200) {
      var userDetails = GithubResponseStructure.fromJson(json.decode(jsonResponse.body));
      // print(userDetails.name);
      // return jsonResponse['status'];
      return userDetails;
    }else if (jsonResponse.statusCode == 400) {
      // return jsonResponse['message'];
    }else {
      // print("Something went wrong!.");
      // return null;
    }
  }

  static Future<List<ReposResponseStructure>> getRepos(String username) async{

    print(url+username+"/repos");
    var jsonResponse = await http.get(url+username+"/repos");

    List<ReposResponseStructure> repos = parseUsers(jsonResponse.body);
    for(var repo in repos)
    print(repo.name);
    if (jsonResponse.statusCode == 200) {
      return repos;
    }else {
      print("Something went wrong!.");
      return null;
    }
  }


  static List<ReposResponseStructure> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ReposResponseStructure>((json) => ReposResponseStructure.fromJson(json)).toList();
  }

}