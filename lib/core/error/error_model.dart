

class ErrorModel{
  final int status;
  final   String message;
  ErrorModel({
    required this.message,required this.status
});
  factory ErrorModel.fromJson(Map<String,dynamic>jsonerror)=>
      ErrorModel(message: jsonerror["message"], status: jsonerror["status"]);

}