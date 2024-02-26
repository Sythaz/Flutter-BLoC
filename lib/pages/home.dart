import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc/bloc/counter.dart';
import 'package:udemy_bloc/pages/data_widget.dart';

import 'data_other_page.dart';

class HomePage extends StatelessWidget {
  //Untuk menggunakan data dari class CounterCubit, diharapkan membuat shorcut pemanggilan class CounterCubit terlebih dahulu
  //Karena menggunakan blocProvider, sekarang tidak memerlukan inisialisasi objek lagi
  // CounterCubit mycounter = CounterCubit();

  //Penyederhanaan BlocProvider.of<CounterCubit>(context) bisa dengan cara seperti inisialisasi diatas
  // CounterCubit mycounter = BlocProvider.of<CounterCubit>(context);

  @override
  Widget build(BuildContext context) {
    CounterCubit myCounter = context.read<CounterCubit>();
    return Scaffold(
        appBar: AppBar(),
        // FAB dibuat untuk peralihan page home ke page DataOtherPage
        floatingActionButton: FloatingActionButton(
          // Beri sebuah icon didalam button FAB
          child: Icon(Icons.navigate_next),
          onPressed: () {
            // Pada saat button FAB di klik akan berpindah page dengan navigator
            Navigator.of(context).pushNamed('/otherPage');
          },
        ),
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
                          // mycounter.kurangData();
                          // Dengan menggunakan BlocProvider kini melakukan fungsi dalam CounterCubit menjadi seperti ini, namun bisa disederhanakan dengan cara menyingkat BlocProvider.of menjadi variabel
                          BlocProvider.of<CounterCubit>(context).kurangData();
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
                  //Refactor widget blocConsumer agar lebih terlihat bersih dan memindahkan code class dataWidget ke file berbeda
                  // DataWidget(mycounter: mycounter),
                  //Kini tak perlu constructor mycounter, karena telah diwakilkan BlocProvider di main.dart
                  DataWidget(),
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
                        // mycounter.tambahData();
                        // Dengan menggunakan BlocProvider kini melakukan fungsi dalam CounterCubit menjadi seperti ini, namun bisa disederhanakan dengan cara menyingkat BlocProvider.of menjadi variabel
                        BlocProvider.of<CounterCubit>(context).tambahData();
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
