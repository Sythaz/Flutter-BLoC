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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          mycounter.kurangData();
                        },
                        child: SizedBox(
                          height: 80,
                          width: 50,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        )),
                  ),

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
                      return Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                          child: SizedBox(
                            width: 160,
                            height: 80,
                            child: Center(
                              child: Text(
                                "$state",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45),
                              ),
                            ),
                          ));
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

                  Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 80,
                        width: 50,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        mycounter.tambahData();
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
