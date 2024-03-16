import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:udemy_bloc/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial([])) {
    on<AddUserEvent>((event, emit) {
      emit(UserLoading(state.allUsers));
      //Menambahkan newUser dari class AddUserEvent(user_event) yang diperoleh dari input add_user kedalam array/list allUsers
      state.allUsers.add(event.newUser);
      emit(UserComplete(state.allUsers));
    });

    on<DeleteUserEvent>((event, emit) {
      emit(UserLoading(state.allUsers));
      //Menambahkan newUser dari class AddUserEvent(user_event) yang diperoleh dari input add_user kedalam array/list allUsers
      state.allUsers.removeWhere((element) => element == event.newUser);
      emit(UserComplete(state.allUsers));
    });
  }
}
