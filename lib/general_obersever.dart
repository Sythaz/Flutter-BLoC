import 'package:bloc/bloc.dart';

class MyObserver extends BlocObserver {
  @override
  void onChange(bloc, change) {
    super.onChange(bloc, change);
    print("\n\n\n\n\n\n$bloc => $change\n\n\n\n\n\n");
  }
}
