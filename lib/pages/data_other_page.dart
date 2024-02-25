import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/counter.dart';

class DataOtherPage extends StatelessWidget {
  const DataOtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit myCounter = context.read<CounterCubit>(); //Instansiasi

    return Scaffold(
      // appBar: AppBar(),
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
