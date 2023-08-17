//this file will hold the app logic
//because screens should not have code that deals with logic

import 'package:rest_api_app/model/user.dart';
import 'package:rest_api_app/model/user_name.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  Future<void> fetchUsers() async {
    print('fetchUsers called');
    final url = 'https://randomuser.me/api/?results=15';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results =
        json['results'] as List<dynamic>; //because it contains different types
    final transformed = results.map((e) {
      //map results list to transformed list using the user model
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      return User(
          cell: e['cell'],
          email: e['email'],
          gender: e['gender'],
          nat: e['nat'],
          phone: e['phone'],
          name: name);
    }).toList();
    setState(() {
      users = transformed;
    });
    print('fetchUsers completed');
  }
}
