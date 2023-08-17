import 'package:flutter/material.dart';
import 'package:rest_api_app/services/user_api.dart';
import '../model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
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
          itemCount: users.length, //cantidad de usuarios en el fetch
          itemBuilder: (context, index) {
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
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
