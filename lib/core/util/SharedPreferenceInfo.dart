import 'dart:convert';
import 'package:ishop/features/Authentication/data/model/Login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
class SharedPreferencesInfo{

  //keys
  static  SharedPreferences? sharedPreferences;


  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static int? gettInt({required String key})
  {
    return sharedPreferences?.getInt(key);
  }
  static  addToSP(LoginResponseModel data,int index) async {
    Map<String, dynamic> map = {
      '': data.data,
    };
     final prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(map);
    prefs.setString(TASKIdKey, json);
       //   print(json);
  }


  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
  static Future<String?> getUserimg() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userImgKey);
  }

  //
  //   static   getSP() async {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? encodedIdList = prefs.getString(TASKIdKey);
  //
  //     var  decodedTaskIdList= jsonDecode(encodedIdList! ?? '[]');
  //     List<Datum> id= List<Datum>.from(decodedTaskIdList.map((i)=>Datum.fromJson(i)));
  //
  //     print(decodedTaskIdList[0][0]);
  //     id = decodedTaskIdList ;
  //     return decodedTaskIdList;
  // }

  // Future<int> getSavedInfo()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? encodedIdList = prefs.getString(TASKIdKey);
  //   Map<String ,dynamic> userMap = jsonDecode(encodedIdList!);
  //   Datum datum = Datum.fromJson(userMap);
  //   return datum.id;
  // }



  static  saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }
  static  saveUserLoggedInimg(String userimg) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userImgKey, userimg);
  }


  static saveUserIdSF(int id) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setInt(userIdKey, id);
  }

  static saveDeviceIdSF(String device_token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(deviceTokenKey, device_token);
  }
  static Future<String?>getDeviceIdSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.getString(deviceTokenKey);
  }
  static saveUserTokenToSF(String token) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userTokenKey, token);
  }

  static  saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  static  saveUserTypeToSF(String type) async {
    SharedPreferences sf = await SharedPreferences.getInstance();

    print(type);
    return await sf.setString(userTypeKey,type);
  }
  static  saveUsernameToSF(String name) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey,name);
  }

  // getting the data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }
  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }
  static Future<int?> getUserIdFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getInt(userIdKey);
  }
  static Future<String?> getUserTokenFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
     var token = sf.getString(userTokenKey);

     print(token);
     return token;
  }
  static Future<String?> getUserTypeFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    var type = sf.getString(userTypeKey);

    print(type);
    return type;
  }


}



