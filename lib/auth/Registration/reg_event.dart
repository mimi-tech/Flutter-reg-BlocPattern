abstract class RegEvent {}

class RegFullNameChanged extends RegEvent {
  final String fullName;
  RegFullNameChanged({required this.fullName});

}
class RegUsernameChanged extends RegEvent {
  final String username;
  RegUsernameChanged({required this.username});

}
class RegEmailChanged extends RegEvent{
  final String email;
  RegEmailChanged({required this.email});
}
class RegPasswordChanged extends RegEvent {
  final String password;
  RegPasswordChanged({required this.password});

}



class RegSubmitted extends RegEvent {}