
abstract class LoginEvent {
  const LoginEvent();
}

class LoginUserEvent extends LoginEvent{
  final String? name;
  final String? password;

  const LoginUserEvent( {
    this.name,
    this.password,

  });
}