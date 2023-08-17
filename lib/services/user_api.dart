//this file will hold the app logic
//because screens should not have code that deals with logic

import 'package:rest_api_app/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    //print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=15';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results =
        json['results'] as List<dynamic>; //because it contains different types
    final users = results.map((e) {
      //map results list to transformed list using the user model

      return User.fromMap(e);
    }).toList();
    return users;
  }
}
