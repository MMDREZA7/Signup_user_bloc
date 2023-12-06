part of 'signup_user_bloc.dart';

@immutable
sealed class SignupUserState {
  List<User> user;

  SignupUserState({
    required this.user,
  });
}

class SignupUserInitial extends SignupUserState {
  SignupUserInitial({required super.user});
}

class SignupUserLoading extends SignupUserState {
  SignupUserLoading({required super.user});
}

class SignupUserLoaded extends SignupUserState {
  SignupUserLoaded({required super.user});
}
