part of 'user_bloc.dart';

//Equatable class
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

//Class penampung atau perantara dari input sebelum tahap pemasukan newUser ke array allUsers di on user_bloc
class AddUserEvent extends UserEvent {
  const AddUserEvent(this.newUser);
  final User newUser;
}

class EditUserEvent extends UserEvent {
  const EditUserEvent(this.newUser);
  final User newUser;
}

class DeleteUserEvent extends UserEvent {
  DeleteUserEvent(this.newUser);
  final User newUser;
}
