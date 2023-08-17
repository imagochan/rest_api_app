//import 'dart:ui';

import 'package:rest_api_app/model/user_dob.dart';
import 'package:rest_api_app/model/user_location.dart';
import 'package:rest_api_app/model/user_name.dart';
import 'package:rest_api_app/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  //factory helps parse data
  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last']);
    final date = e['dob']['date'];
    final dob = UserDob(date: DateTime.parse(date), age: e['dob']['age']);
    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);
    return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
