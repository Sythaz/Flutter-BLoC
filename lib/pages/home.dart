import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/counter.dart';

class HomePage extends StatelessWidget {
  //Untuk menggunakan data dari class CounterCubit, diharapkan membuat shorcut pemanggilan class CounterCubit terlebih dahulu
  CounterCubit mycounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //BlocConsumer adalah gabungan antara blocListener dengan blocBuilder yang terdapat bloc: sebagai target pengawasan terhadap perubahan, buildWhen:, builder:, listener:, dan listenWhen:
              BlocConsumer<CounterCubit, int>(
                bloc: mycounter,
                //blocBuilder memiliki buildWhen yang berguna untuk menentukan kapan builder me-rebuild UI dengan if return true dan false, previous dan current seperti namanya adalah sebuah data lama dan data saat ini
                buildWhen: (previous, current) {
                  if (previous == 1) {
                    return false;
                  } else
                    return true;
                },
                //blocBuilder memiliki state, berbeda dengan streamBuilder yang memiliki snapshot yang memiliki informasi status dan data. blocBuilder state hanya memiliki informasi data saja
                builder: (context, state) {
                  return Text("$state");
                },
                //Function utama blocListener, bagian untuk menampilkan kebutuhan seperti dialog atau snackBar
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 200),
                      content: Text("Genap!"),
                    ),
                  );
                },
                //Function utama blocListener, bagian untuk menampilkan kebutuhan seperti dialog atau snackBar
                listenWhen: (previous, current) {
                  if (current % 2 == 0) {
                    return true;
                  } else {
                    return false;
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        mycounter.kurangData();
                      },
                      icon: Icon(Icons.remove)),
                  IconButton(
                      onPressed: () {
                        mycounter.tambahData();
                      },
                      icon: Icon(Icons.add))
                ],
              ),
            ],
          ),
        ));
  }
}
