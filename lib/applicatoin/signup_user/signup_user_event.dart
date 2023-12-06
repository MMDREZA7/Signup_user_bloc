part of 'signup_user_bloc.dart';

@immutable
sealed class SignupUserEvent {}

class AddUserEvent extends SignupUserEvent {
  final User user;

  AddUserEvent({
    required this.user,
  });
}

class RemoveUserEvent extends SignupUserEvent {
  final User user;

  RemoveUserEvent({
    required this.user,
  });
}
