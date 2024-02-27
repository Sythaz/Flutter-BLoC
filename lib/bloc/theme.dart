import 'package:bloc/bloc.dart';

//Class BLoC untuk menyimpan data boolean ThemeCubit
class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  //Method jika tiap klik pada tombol ganti tema akan merubah value boolean state
  void changeTheme() => emit(!state);
}
