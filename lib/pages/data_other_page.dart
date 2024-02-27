import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/counter.dart';
import 'package:udemy_bloc/bloc/theme.dart';

class DataOtherPage extends StatelessWidget {
  const DataOtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit myCounter = context.read<CounterCubit>(); //Instansiasi
    ThemeCubit myTheme = context.read<ThemeCubit>();

    return Scaffold(
      //Karena tombol FAB sudah digunakan di page home, kita buat tombol FAB di otherPage
      floatingActionButton: FloatingActionButton(
        // OnPressed didahului dengan () => sebagai tanda pemanggilan method(?) untuk merubah value boolean state dari ThemeCubit
        onPressed: () => myTheme.changeTheme(),
        child: Icon(Icons.sunny),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder(
              //Saat menggunakan bloc yang belum di instansiasi, data adalah 0. Karena kita seolah-olah memakai data baru/lain begitupun dengan page yang terdapat BlocProvider
              // bloc: context.read<CounterCubit>(),

              //Lebih baik gunakan instansiasinya
              bloc: myCounter,
              builder: (context, state) => Text("$state"),
            )
          ],
        ),
      ),
    );
  }
}
