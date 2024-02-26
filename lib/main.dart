import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/counter.dart';
import 'package:udemy_bloc/pages/data_other_page.dart';
import 'package:udemy_bloc/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //Instansiasi disini
  CounterCubit myCounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    //Sebelumnya menggunakan BlocProvider() sebagai pembungkus MaterialApp (Global Access)
    // BlocProvider(
    // create: (context) => CounterCubit(),
    // child:
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => BlocProvider.value(
              //Value tidak bisa langsung class BLoC nya karena akan menjadikan value tiap page berbeda/dikira beda class. Sehingga dibuat instansiasi terlebih dahulu
              // value: CounterCubit(),
              value: myCounter,
              child: HomePage(),
            ),
        "/otherPage": (context) => BlocProvider.value(
              // value: CounterCubit(),
              value: myCounter,
              child: DataOtherPage(),
            ),
      },
      // home: HomePage(),
    );
    // );
  }
}
