import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/user_bloc.dart';
import 'package:udemy_bloc/models/user.dart';

class EditUserPage extends StatelessWidget {
  EditUserPage(this.user, {super.key});

  //Karena kita membutuhkan data dari class user dari field yang kita sentuh, maka kita membutuhkan atr dan constr dari user yang dikirimkan dari HOME
  User user;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    // Memperbarui/inisialisasi nameController dengan data class user, sehingga TextField langsung menyediakan nama user dan umur (tidak kosong)
    nameController.text = user.name;
    ageController.text = user.age
        .toString(); //user.age berisi integer sehingga diubah menjadi toString

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Edit User"),
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
            onPressed: () {
              userB.add(
                EditUserEvent(
                  User(
                    user.id, //ID disini tidak random dikarenakan berguna untuk menandai id yang ingin diedit sehingga bisa merubah nama dan umur pada objek berID ini
                    nameController.text,
                    int.parse(ageController.text),
                  ),
                ),
              );
              Navigator.pop(context);
            },
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
}
