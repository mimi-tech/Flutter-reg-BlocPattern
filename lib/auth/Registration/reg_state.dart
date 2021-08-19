import 'package:flutterblocregistrationapp/auth/submitFormStatus.dart';

class RegState {
  final String fullName;
  bool get isValidFullName => fullName.length > 6;

  final String username;
  bool get isValidUsername => username.length > 3;

  final String email;
  bool get isValidEmail => email.length > 3;


  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  RegState({
    this.fullName = '',
    this.username = '',
    this.email = '',
    this.password = '',

    this.formStatus = const InitialFormStatus(),
  });

  RegState copyWith({
    String? fullName,
    String? username,
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return RegState(
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      password: password ?? this.password,
      email:    email ?? this.email,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}