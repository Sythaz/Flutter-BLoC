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
              //Widget digunakan sebagai pendengar atau penanggap jika terdapat perubahan dalam BLoC, seringkali digunakan sebagai penampil dialog atau snackBar
              BlocListener<CounterCubit, int>(
                //Mirip seperti blocBuilder yang membutuhkan bloc untuk target pengawasan terhadap perubahan
                bloc: mycounter,
                //Mirip buildWhen yang menentukan kondisi untuk menampilkan hasil listener:
                listenWhen: (previous, current) {
                  if (current % 2 == 0) {
                    return true;
                  } else {
                    return false;
                  }
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
                child:
                    //BlocBuilder digunakan sebagai widget yang bisa mem-build ulang ketika terdapat perubahan dari bloc:, bedanya blocBuilder lebih optimal untuk merender UI yang terkait dan berkaitan dengan BLoC
                    BlocBuilder<CounterCubit, int>(
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
                ),
                // //StreamBuilder digunakan sebagai widget yang bisa mem-build ulang jika terdapat perubahan value pada data stream:
                // StreamBuilder(
                //   //Stream berguna untuk menandai dan mengalirkan data mana yang perlu diwaspadai akan perubahannya
                //   stream: mycounter.stream,
                //   //InitialData seperti namanya berguna untuk menentukan value awal, namun disini hanya perlu memanggilnya karena initialData sudah di inisialisasi dalam constructor CounterCubit
                //   initialData: mycounter.initialData,
                //   //Snapshot berguna sebagai informasi tentang ketersediaan data (.hasData), ketersediaan error (.hasError), data terkini (.data), status koneksi (.connectionState)
                //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                //     return Column(
                //       children: [
                //         Text("${snapshot.data}"),
                //         Text("Current: ${mycounter.current}"),
                //         Text("Next: ${mycounter.next}")
                //       ],
                //     );
                //   },
                // ),
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
