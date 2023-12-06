import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:signup_user/models/user.dart';

part 'signup_user_event.dart';
part 'signup_user_state.dart';

List<User> userList = [];

class SignupUserBloc extends Bloc<SignupUserEvent, SignupUserState> {
  SignupUserBloc() : super(SignupUserInitial(user: [])) {
    //

    // * add user process
    on<AddUserEvent>((event, emit) async {
      emit(
        SignupUserLoading(user: userList),
      );

      userList.add(event.user);

      await Future.delayed(
        const Duration(seconds: 2),
      );

      emit(
        SignupUserLoaded(user: userList),
      );
    });

    // * remove user process
    on<RemoveUserEvent>((event, emit) {
      emit(
        SignupUserLoading(user: userList),
      );

      userList.remove(event.user);

      emit(
        SignupUserLoaded(user: userList),
      );
    });
  }
}
