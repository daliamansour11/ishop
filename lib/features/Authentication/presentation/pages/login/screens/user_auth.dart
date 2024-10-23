import 'package:flutter/material.dart';
import 'package:ishop/core/resources/colors_manger.dart';
import 'package:ishop/core/resources/strings_manger.dart';

import '../../../../../../core/util/customAppBar.dart';
import 'LoginScreen.dart';


class UserAuth extends StatefulWidget {
  const UserAuth({super.key});

  @override
  State<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body:   Stack(children: [
        ClipPath(
          clipper: CustomClipperExample1(),
          child: Container(
            color: ColorsManger.lightPrimary,
            width: size.width,
            height: 330,
            child: Center(
              child: Text(""),
            ),
          ),
        ),
        ClipPath(
          clipper: CustomClipperExample(),
          child: Container(
            color: ColorsManger.primary,
            width: size.width,
            height: 323,
            child: const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/engine"),
                        radius: 35.0,
                      ),
                    ),
                    Text(
                      AppString.home_appBar,
                      style: TextStyle(
                        color: ColorsManger.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
    Padding(
      padding: const EdgeInsets.only(top: 350),
      child: Column(
                children: [
                const  Text(
                    'Welcome !',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorsManger.primary,
                    ),
                  ),
                const   SizedBox(height: 40),

                  // Create Account Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Create Account Screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding:const EdgeInsets.symmetric(horizontal: 80, vertical: 15), backgroundColor: ColorsManger.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child:const Text(AppString.Create_account,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                const  SizedBox(height: 15),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15), backgroundColor: ColorsManger.white,
                      shape: RoundedRectangleBorder(
                        side:const  BorderSide(color: ColorsManger.primary),

                        borderRadius: BorderRadius.circular(30),
                      ),
                    ), child: const Text(AppString.login_button,
                    style: TextStyle(fontSize: 16),
                  ),
                  ),
               const   SizedBox(height: 30),

                  // Social Media Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.alternate_email),
                        color: ColorsManger.primary,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:const Icon(Icons.linked_camera),
                        color: ColorsManger.primary,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:const Icon(Icons.facebook),
                        color: ColorsManger.primary,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:const Icon(Icons.g_mobiledata),
                        color: ColorsManger.primary,
                      ),
                    ],
                  ),
                const  Text(AppString.Sign_in_with,
                    style: TextStyle(color: ColorsManger.primary,fontSize: 20),
                  ),
                ]// Welcome text
            ),
    ),
        ],
      ),
    );


  }
}
