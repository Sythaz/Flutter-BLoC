import 'package:flutter/material.dart';
import 'package:udemy_bloc/bloc/counter.dart';
import 'package:udemy_bloc/routes/route_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //Instansiasi disini
  CounterCubit myCounter = CounterCubit();
  RoutePages myRoute = RoutePages();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Terlihat lebih clean dengan meletakkan route berada di file berbeda
      onGenerateRoute: myRoute.namaRouteNih,
    );
    // );
  }
}
