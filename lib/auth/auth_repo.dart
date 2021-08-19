class AuthRepository {
  Future<void> login() async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('logged in');
    throw Exception('failed log in');
  }
}

class RegAuthRepository {
  Future<void> register() async {
    print('attempting registration');
    await Future.delayed(Duration(seconds: 3));
    print('Registered successfully');
    throw Exception('failed log in');
  }
}