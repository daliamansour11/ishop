import 'package:flutter/material.dart';
import 'package:ishop/core/extensions/extentions.dart';
import 'package:ishop/core/util/BottomNaivgation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import'package:flutter/animation.dart';
import '../../core/constants/constants.dart';
import '../../core/resources/assets_manger.dart';
import '../../main.dart';
import '../Authentication/presentation/pages/login/screens/LoginScreen.dart';
import '../Authentication/presentation/pages/signUp/SignUpScreen.dart';



class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin {

  bool _isAnimate= false;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // Future.delayed
    //   (Duration(milliseconds: 40),() async {
      checkLogedIn( context);
    // });
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: 4000));
    animation=Tween(begin: 100.0,end: 800.0).animate(controller);
    animation.addListener((){
      setState(() {

      });
    });
    controller.forward();
    // Future.delayed(Duration(milliseconds: 500),(){
    //   setState(() {
    //     _isAnimate=true;
    //   });
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text('Welcome to You Chat'),),
      body:  Stack(children: [Image.asset(ImageAssets.splashLogo,height: animation.value,width: animation.value,),
        Positioned(
          bottom: mq.height * .29,
          width: mq.width,
          child: Text('Welcome to Ishop ❤️',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30))),


      ]),

    );
  }
  Future checkLogedIn( BuildContext context) async {
    await Future.delayed
      (Duration(seconds: 6), () async {
      SharedPreferences shared = await SharedPreferences.getInstance();
      final String? usertoken = shared.getString(
          '${userTokenKey}');
      if (usertoken != null &&
          usertoken != "") {
        print(
            "shhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh    ${usertoken}");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) =>const BottomNavigation()));
      }
      else {

       context.pushNamed(const LoginScreen());
      }
    });
  }
}