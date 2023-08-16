import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http; //imported http package from pub.dev

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
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
          final email = user['email'];
          return ListTile(
            leading: Text('${index +1}'),
            title: Text(email),
          );
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers, //void calls do not need parentheses ()
      ),
    );
  }

  void fetchUsers() async {
    print('fetchUsers called');
    final url = 'https://randomuser.me/api/?results=15';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print('fetchUsers completed');
  }
}
