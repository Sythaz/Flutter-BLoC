import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/user_bloc.dart';
import 'package:udemy_bloc/models/user.dart';
import 'package:udemy_bloc/pages/add/add_user.dart';
import 'package:udemy_bloc/pages/edit/edit_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
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
        body: BlocBuilder<UserBloc, UserState>(
          bloc: userB,
          builder: (context, state) {
            if (state.allUsers.isEmpty) {
              return Center(
                child: Text("Tidak memiliki user."),
              );
            }
            return ListView.builder(
              itemCount: state.allUsers.length,
              itemBuilder: (BuildContext context, int index) {
                User user = state.allUsers[index];
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
                  title: Text("Nama User: ${user.name}"),
                  subtitle: Text("Umur User: ${user.age}"),
                  trailing: IconButton(
                    onPressed: () {
                      //Add disini bekerja pengirim, UserBloc mengirimkan event yang berisi array allUsers sekarang dengan index
                      //
                      userB.add(DeleteUserEvent(user));
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
