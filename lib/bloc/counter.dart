import 'package:bloc/bloc.dart';

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
