import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rest_api_app/model/user_name.dart';

import '../model/user.dart';
//imported http package from pub.dev

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState(){
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,//cantidad de usuarios en el fetch
        itemBuilder: (context, index){
          final user = users[index];
          
          //final color = user.gender == 'male' ? Colors.lightBlue : Colors.lightGreen;
          return ListTile(
            title: Text(user.name.first),
            subtitle: Text(user.phone),
            //tileColor: color,
          );
        }),
    );
  }

  Future<void> fetchUsers() async {
    print('fetchUsers called');
    final url = 'https://randomuser.me/api/?results=15';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;//because it contains different types
    final transformed = results.map((e) {//map results list to transformed list using the user model
        final name = UserName(title: e['name']['title'], first: e['name']['first'], last: e['name']['last']);
        return User(
          cell: e['cell'],
          email: e['email'],
          gender: e['gender'],
          nat: e['nat'],
          phone: e['phone'],
          name: name
        );
      }).toList();
    setState(() {
      users = transformed;
    });
    print('fetchUsers completed');
  }
}
