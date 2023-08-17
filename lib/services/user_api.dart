//this file will hold the app logic
//because screens should not have code that deals with logic

import 'package:rest_api_app/model/user.dart';
import 'package:rest_api_app/model/user_dob.dart';
import 'package:rest_api_app/model/user_location.dart';
import 'package:rest_api_app/model/user_name.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print('fetchUsers called');
    final url = 'https://randomuser.me/api/?results=15';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results =
        json['results'] as List<dynamic>; //because it contains different types
    final users = results.map((e) {
      //map results list to transformed list using the user model
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      final date = e['dob']['date'];
      final dob = UserDob(date: DateTime.parse(date), age: e['dob']['age']);
      final coordinates = LocationCoordinate(
          latitude: e['location']['coordinates']['latitude'],
          longitude: e['location']['coordinates']['longitude']);
      final street = LocationStreet(
          name: e['location']['street']['name'],
          number: e['location']['street']['number']);
      final timezone = LocationTimezone(
          description: e['location']['timezone']['description'],
          offset: e['location']['timezone']['offset']);
      final location = UserLocation(
          city: e['location']['city'],
          coordinates: coordinates,
          country: e['location']['country'],
          postcode: e['location']['postcode'].toString(),
          state: e['location']['state'],
          street: street,
          timezone: timezone); //some post codes are strings
      return User(
          cell: e['cell'],
          email: e['email'],
          gender: e['gender'],
          nat: e['nat'],
          phone: e['phone'],
          name: name,
          dob: dob,
          location: location);
    }).toList();
    return users;
  }
}
