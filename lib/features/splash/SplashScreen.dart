import 'package:flutter/material.dart';
import 'package:ishop/core/resources/BottomNaivgation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/constants.dart';
import '../../main.dart';
import '../Authentication/presentation/pages/signUp/SignUpScreen.dart';



class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  bool _isAnimate= false;
  @override
  void initState() {
    Future.delayed
      (Duration(milliseconds: 40),() async {
      checkLogedIn( context);
    });
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      setState(() {
        _isAnimate=true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text('Welcome to You Chat'),),
      body:  Stack(children: [
        AnimatedPositioned(
            top: mq.height * .23,
            right:_isAnimate? mq.width * .25: -mq.width * .5,
            width: mq.width * .5,
            duration: Duration(milliseconds:1300 ),
            child: Image.asset('')),
        Positioned(
          bottom: mq.height * .35,
          width: mq.width,
          child: Text('Welcome to Ishop ❤️',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30))),


      ]),

    );
  }
  Future checkLogedIn( BuildContext context) async {
    await Future.delayed
      (Duration(seconds: 3), () async {
      SharedPreferences shared = await SharedPreferences.getInstance();
      final String? usertoken = shared.getString(
          '${userTokenKey}');
      if (usertoken != null &&
          usertoken != "") {
        print(
            "shhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh    ${usertoken}");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => BottomNavigation()));
      }
      else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Signupscreen()));
      }
    });
  }
}