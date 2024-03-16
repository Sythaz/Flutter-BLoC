import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/user_bloc.dart';
import 'package:udemy_bloc/models/user.dart';

class AddUserPage extends StatelessWidget {
  AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Add User"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 10),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "User name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            controller: ageController,
            decoration: InputDecoration(
              labelText: "User age",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: ContinuousRectangleBorder(),
              backgroundColor: Colors.blueAccent,
            ),
            child: Text(
              "Submit",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            onPressed: () {
              userB.add(
                AddUserEvent(
                  User(
                    Random().nextInt(9999),
                    nameController.text,
                    int.parse(ageController.text),
                  ),
                ),
              );
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
