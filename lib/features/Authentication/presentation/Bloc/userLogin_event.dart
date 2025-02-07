
import '../../data/model/login_requestBody.dart';

abstract class LoginEvent {
  const LoginEvent();
    login(LoginRequestBody());
}

class LoginUserEvent extends LoginEvent{



  const LoginUserEvent(LoginRequestBody loginRequestBody);

  @override
  login(LoginRequestBody()) {

  }


}