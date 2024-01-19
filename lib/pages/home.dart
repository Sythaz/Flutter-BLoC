import 'package:flutter/material.dart';
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
              //StreamBuilder digunakan sebagai widget yang bisa mem-build ulang jika terdapat perubahan value pada data stream:
              StreamBuilder(
                //Stream berguna untuk menandai dan mengalirkan data mana yang perlu diwaspadai akan perubahannya
                stream: mycounter.stream,
                //InitialData seperti namanya berguna untuk menentukan value awal, namun disini hanya perlu memanggilnya karena initialData sudah di inisialisasi dalam constructor CounterCubit
                initialData: mycounter.initialData,
                //Snapshot berguna sebagai informasi tentang ketersediaan data (.hasData), ketersediaan error (.hasError), data terkini (.data), status koneksi (.connectionState)
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Column(
                    children: [
                      Text("${snapshot.data}"),
                      Text("Current: ${mycounter.current}"),
                      Text("Next: ${mycounter.next}")
                    ],
                  );
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