part of 'user_bloc.dart';

@immutable
//Equatable class
sealed class UserState {
  UserState(this.allUsers);

  List<User> allUsers;

  @override
  List<Object> get props => [allUsers];
}

final class UserInitial extends UserState {
  UserInitial(super.allUsers);
}
