part of 'user_bloc.dart';

//Equatable class
sealed class UserState {
  UserState(this.allUsers);

  
  List<User> allUsers;

  @override
  List<Object> get props => [allUsers];
}

//Class keadaan-keadaan yang bisa dipanggil sesuai kebutuhan, seperti jika menginginkan loading, complete, error pada suatu waktu. Bisa dipakai di emit user_bloc
//allUsers adalah array / list para user yang diinput
final class UserInitial extends UserState {
  UserInitial(super.allUsers);
}

final class UserLoading extends UserState {
  UserLoading(super.allUsers);
}

final class UserComplete extends UserState {
  UserComplete(super.allUsers);
}

final class UserError extends UserState {
  UserError(super.allUsers);
}
