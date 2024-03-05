import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:udemy_bloc/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(UserInitial([
          User(1, "anton", 2),
          User(1, "anton", 2),
          User(1, "anton", 2),
        ])) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
