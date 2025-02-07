
class LoginRequestBody{

  final String email;
  final String password;

  LoginRequestBody(this.email, this.password);
Map<String,dynamic>toJson()=>{
  "email":email,
  "password":password
  };

}
