import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers, //void calls do not need parentheses ()
      ),
    );
  }

  void fetchUsers() {
    print('fetchUsers called');
  }
}
