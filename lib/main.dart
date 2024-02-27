import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/counter.dart';
import 'package:udemy_bloc/bloc/theme.dart';
import 'package:udemy_bloc/routes/route_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //Instansiasi disini
  RoutePages myRoute = RoutePages();
  ThemeCubit myTheme = ThemeCubit();

  @override
  Widget build(BuildContext context) {
    //Kita buat BlocProvider untuk menyimpan state boolean perubahan tema
    return BlocProvider(
      create: (context) => myTheme,
      //Lalu buat BlocProvider juga untuk rebuild tiap value state berubah
      child: BlocBuilder(
        bloc: myTheme,
        builder: (context, state) {
          return MaterialApp(
            //Menggunakan ternary untuk mengatisipasi state bernilai TRUE maupun FALSE
            theme: myTheme.state ? ThemeData.light() : ThemeData.dark(),
            //Terlihat lebih clean dengan meletakkan route berada di file berbeda
            onGenerateRoute: myRoute.namaRouteNih,
          );
        },
      ),
    );
  }
}
