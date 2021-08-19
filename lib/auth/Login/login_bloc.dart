import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocregistrationapp/auth/Login/login_event.dart';
import 'package:flutterblocregistrationapp/auth/Login/login_state.dart';
import 'package:flutterblocregistrationapp/auth/auth_repo.dart';
import 'package:flutterblocregistrationapp/auth/submitFormStatus.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // Username updated
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);

      // Password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        //yield state.copyWith(formStatus: SubmissionFailed());
      }
    }
  }
}