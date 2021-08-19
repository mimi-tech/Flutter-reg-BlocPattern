import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocregistrationapp/auth/Registration/reg_event.dart';
import 'package:flutterblocregistrationapp/auth/Registration/reg_state.dart';
import 'package:flutterblocregistrationapp/auth/auth_repo.dart';
import 'package:flutterblocregistrationapp/auth/submitFormStatus.dart';


class RegBloc extends Bloc<RegEvent, RegState> {
  final RegAuthRepository authRepo;

  RegBloc({required this.authRepo}) : super(RegState());

  @override
  Stream<RegState> mapEventToState(RegEvent event) async* {
    // fullName updated
    if (event is RegFullNameChanged) {
      yield state.copyWith(fullName: event.fullName);

      // user name updated
    }else if(event is RegUsernameChanged) {
      yield state.copyWith(username: event.username);

      // password updated
    }else if (event is RegPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    }else if(event is RegEmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is RegSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.register();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        //yield state.copyWith(formStatus: SubmissionFailed());
      }
    }
  }
}