import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// Class dengan Cubit sebagai pembelajaran yang lebih sederhana daripada BLoC?
class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  // Jika ingin menggunakan data dalam class CounterCubit, dideklarasi terlebih dahulu untuk memudahkan pemanggilan
  int initialData;
  int? current;
  int? next;

  void tambahData() {
    //Emit mirip seperti return namun bukan berarti sama, emit berguna untuk memberi tahu DAN mengubah suatu value
    emit(state + 1);
  }

  void kurangData() {
    //Emit mirip seperti return namun bukan berarti sama, emit berguna untuk memberi tahu DAN mengubah suatu value
    emit(state - 1);
  }

  //Pelaporan atau notifier terhadap perubahan pada suatu data (change)
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    //Di dalam change terdapat currentState dan nextState, sebelum digunakan harus di deklarasi terlebih dahulu
    current = change.currentState;
    next = change.nextState;
    print(change);
  }

  //Pelaporan terhadap error (Belum di Implementasikan)
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(stackTrace);
  }
}

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
