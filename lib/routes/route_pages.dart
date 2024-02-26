import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/counter.dart';
import 'package:udemy_bloc/pages/data_other_page.dart';
import 'package:udemy_bloc/pages/home.dart';

//Menggunakan class biasa tanpa extend stateless atau statefull untuk class route
class RoutePages {
  CounterCubit myCounter = CounterCubit();

  //Tambahkan method ((bukan constructor); func milik object) Route
  Route namaRouteNih(RouteSettings parameterRoute) {
    switch (parameterRoute.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            //Value tidak bisa langsung class BLoC nya karena akan menjadikan value tiap page berbeda/dikira beda class. Sehingga dibuat instansiasi terlebih dahulu
            value: myCounter,
            child: HomePage(),
          ),
        );
      case "/otherPage":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: myCounter,
            child: DataOtherPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: myCounter,
            child: HomePage(),
          ),
        );
    }
  }
}
