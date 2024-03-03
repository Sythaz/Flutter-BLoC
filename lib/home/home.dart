import 'package:flutter/material.dart';
import 'package:udemy_bloc/pages/add/add_user.dart';
import 'package:udemy_bloc/pages/edit/edit_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddUserPage(),
              ),
            );
          },
        ),
        appBar: AppBar(
          title: Text("HomePage BLoC"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditUserPage(),
                  ),
                );
              },
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              title: Text("Nama User"),
              subtitle: Text("Umur User"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
    );
  }
}
