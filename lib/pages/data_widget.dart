import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/counter.dart';

class DataWidget extends StatelessWidget {
  //Tak perlu memakai constructor lagi untuk melempar-lempar data
  // const DataWidget({
  //   super.key,
  //   required this.mycounter,
  // });
  // final CounterCubit mycounter;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, int>(
      //BlocConsumer adalah gabungan antara blocListener dengan blocBuilder yang terdapat bloc: sebagai target pengawasan terhadap perubahan, buildWhen:, builder:, listener:, dan listenWhen:
      // bloc: mycounter,
      //blocBuilder memiliki buildWhen yang berguna untuk menentukan kapan builder me-rebuild UI dengan if return true dan false, previous dan current seperti namanya adalah sebuah data lama dan data saat ini

      //Sekarang isi bloc bukan lagi berisi data mycounter yang terlempar-lempar oleh constructor, bloc diisi oleh blocProvider. Bisa disederhanakan menjadi sebuah variabel seperti mycounter, sehingga cukup menulis mycounter
      bloc: BlocProvider.of<CounterCubit>(context),
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
    );
  }
}
