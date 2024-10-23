import 'package:flutter/material.dart';

import '../../../../../../../core/resources/assets_manger.dart';
import '../../../../../../../core/resources/colors_manger.dart';
import '../../../../../../../core/resources/strings_manger.dart';
import '../../../../../../../core/resources/values_manger.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _SignUpState();
}

class _SignUpState extends State<ProfileView> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  var value = false;
  bool showSpinner =false;
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }
  TextEditingController userNameController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController genderController =  TextEditingController();
  bool ischecked = false;
  late String? email;
  late String? password;
  bool isvisible =false;
  void _toggle() {
    setState(() {
      isvisible = !isvisible;
    });
  }
  void _remove(){

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body:
        Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2.95552,
                decoration:const BoxDecoration(
                    color: ColorsManger.white,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))
                ),
                child: Stack(
                    children: [
                      Container(
                        height: 210,
                        decoration:   BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),

                        width: double.infinity,
                        child:  Image.asset(ImageAssets.frame_img),
                      ),

                      Padding(
                          padding: const EdgeInsets.only(top: AppSize.s132,
                              left: AppSize.s139,right: AppSize.s139),
                          child: Align(
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Container(

                                  decoration:   BoxDecoration(
                                      color:  ColorsManger.white,

                                      boxShadow: [
                                        BoxShadow(
                                          color:ColorsManger.lightPrimary.withOpacity(0.15),
                                          spreadRadius: 4,
                                          blurRadius: 0,
                                          // offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],

                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(width: 5,color: ColorsManger.white)

                                  ),
                                  height: 116,
                                  width: 116,
                                  child: Image.asset(ImageAssets.login_img
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    ]
                ) ,

              ),

              Expanded(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left:AppPadding.p12,top: AppPadding.p16),
                        child: Align(
                            alignment:Alignment.topCenter,child: Text(AppString.createNewAccount,style: Theme.of(context).textTheme.titleLarge,)),
                      ),
                      SizedBox(height: AppSize.s6,),
                      Expanded(
                        child: Container(
                            height: MediaQuery.of(context).size.height/2.43,
                            width: MediaQuery.of(context).size.width/1.139,

                            decoration:const BoxDecoration(
                                color: ColorsManger.white,
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(AppSize.s12))
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                  children: [
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              decoration:const BoxDecoration(color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),

                                              ),
                                              child:  Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Padding(
                                                        padding: const EdgeInsets.only(top: AppPadding.p12),
                                                        child: Container(
                                                          height: 17,
                                                          width: 77,
                                                          child:
                                                          Text(AppString.userNamelabel,style:
                                                          Theme.of(context).textTheme.titleSmall,),
                                                        )),),


                                                  SizedBox(height: 3,),

                                                  Padding(
                                                    padding: const EdgeInsets.only(top:AppPadding.p4 ),
                                                    child: Container(

                                                      width: MediaQuery.of(context).size.width,
                                                      decoration:const BoxDecoration(color: Colors.white,
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(AppSize.s8)),
                                                      ),
                                                      child:TextFormField(
                                                        controller: userNameController,
                                                     // /*   obscureText: false,
                                                     //    validator: (value) {
                                                     //      if (value!.isEmpty ||
                                                     //          value == null) {
                                                     //        return  AppString.invaliduserNamehint;
                                                     //      }
                                                     //
                                                     //      return null;
                                                     //    },
                                                     //    onChanged: (value) {
                                                     //
                                                     //    },
                                                     //    keyboardType: TextInputType
                                                     //        .text,
                                                     //    decoration: InputDecoration(
                                                     //
                                                     //      // border: OutlineInputBorder(
                                                     //      //   borderRadius:
                                                     //      //   BorderRadius.all(
                                                     //      //       Radius.circular(20)
                                                     //      //   ),),
                                                     //
                                                     //      hintText: AppString.userNamehint,
                                                     //
                                                     //      // contentPadding: EdgeInsets
                                                     //      //     .symmetric(
                                                     //      //     vertical: AppSize.s1, horizontal: AppSize.s5),
                                                     //      //hint text
                                                     //      suffixIcon:IconButton(icon: Icon(Icons.highlight_remove_outlined ), onPressed: () {
                                                     //        userNameController.clear();
                                                     //      },),
                                                     //      //prefix iocn
                                                     //      hintStyle: Theme.of(context).textTheme.bodySmall,
                                                     //      //hint text style
                                                     //      labelStyle:Theme.*/of(context).textTheme.titleSmall, ), //label style

                                                      ),
                                                    ),
                                                  ),




                                                ],
                                              ),
                                            ),
                                           const SizedBox(height: AppSize.s4,),
                                            Container(
                                              decoration:const BoxDecoration(color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),

                                              ),
                                              child:  Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Padding(
                                                        padding: const EdgeInsets.
                                                        only(top:AppPadding.p8),
                                                        child: Container(
                                                          height: 20,
                                                          width: 77,
                                                          child:
                                                          Text(AppString.Emaillabel,style:
                                                          Theme.of(context).textTheme.titleSmall,),
                                                        )),),

                                                  // SizedBox(height: AppSize.s3,),

                                                  Padding(
                                                    padding: const EdgeInsets.only(top:AppPadding.p4 ),
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      decoration:const BoxDecoration(color: Colors.white,
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(AppSize.s8)),
                                                      ),
                                                      child:TextFormField(
                                                        controller: emailController,
                                                        obscureText: false,
                                                        // validator: (value) {
                                                        //   if (value!.isEmpty ||
                                                        //       value == null) {
                                                        //     return  AppString.invalidEmail;
                                                        //   }
                                                        //   else if (!value.contains("@") ||
                                                        //       !value.contains(".")) {
                                                        //     return AppString.invalidEmail;
                                                        //   }
                                                        //   return null;
                                                        // },
                                                        // onChanged: (value) {
                                                        // },
                                                        // keyboardType: TextInputType
                                                        //     .emailAddress,
                                                        // decoration: InputDecoration(
                                                        //
                                                        //   border: OutlineInputBorder(
                                                        //     borderRadius:
                                                        //     BorderRadius.all(
                                                        //         Radius.circular(20)
                                                        //     ),),
                                                        //
                                                        //   hintText: AppString.emailhint,
                                                        //
                                                        //   contentPadding: EdgeInsets
                                                        //       .symmetric(
                                                        //       vertical: AppSize.s1, horizontal: AppSize.s5),
                                                        //   //hint text
                                                        //
                                                        //
                                                        //   suffixIcon: IconButton(
                                                        //     icon: Icon(
                                                        //         Icons.highlight_remove), onPressed: () {
                                                        //     emailController.clear();
                                                        //   },
                                                        //   ),



                                                          //prefi)x iocn
                                                          // hintStyle: Theme.of(context).textTheme.bodySmall,
                                                          // //hint text style
                                                          // labelStyle:Theme.of(context).textTheme.titleSmall, ), //label style

                                                      ),
                                                    ),
                                                  ),

                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Padding(
                                                        padding: const EdgeInsets.only(top:12,bottom: 12),
                                                        child: Container(


                                                          child:
                                                          Text(AppString.gender,style:
                                                          Theme.of(context).textTheme.titleSmall,),
                                                        )),),

                                                  const SizedBox(height: 3,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:AppPadding.p8
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      decoration:const BoxDecoration(color: Colors.white,
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(8)),
                                                      ),
                                                      child:TextFormField(

                                                        controller: genderController,
                                                        obscureText: isvisible,

                                                        validator: (value) {
                                                          if (value!.isEmpty ||
                                                              value == null) {
                                                            return  "invalidpassword";
                                                          }

                                                          return null;
                                                        },
                                                        onChanged: (value) {

                                                        },
                                                        keyboardType: TextInputType
                                                            .visiblePassword,
                                                        decoration: InputDecoration(

                                                          border:const OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(20)
                                                            ),),

                                                          hintText:"gender",

                                                          contentPadding:const EdgeInsets
                                                              .symmetric(
                                                              vertical: 1, horizontal:5),
                                                          //hint text


                                                          suffixIcon: IconButton(
                                                            icon: Icon(isvisible
                                                                ? Icons.visibility_off :
                                                            Icons.visibility),
                                                            onPressed:()=>_toggle(),

                                                          ),
                                                          //prefi)x iocn
                                                          hintStyle: Theme.of(context).textTheme.bodySmall,
                                                          //hint text style
                                                          labelStyle:Theme.of(context).textTheme.titleSmall, ), //label style

                                                      ),
                                                    ),
                                                  ),


                                                  // SizedBox(height: AppSize.s3,),

                                                  Padding(
                                                    padding: const EdgeInsets.only(top:AppPadding.p4 ),
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      decoration:const BoxDecoration(color: Colors.white,
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(AppSize.s8)),
                                                      ),
                                                      child:TextFormField(

                                                        controller: genderController,
                                                        obscureText: isvisible,

                                                        // // validator: (value) {
                                                        // //   if (value!.isEmpty ||
                                                        // //       value == null) {
                                                        // //     return  AppString.invalidpassword;
                                                        // //   }
                                                        //
                                                        //   return null;
                                                        // },
                                                        onChanged: (value) {

                                                        },

                                                      ),
                                                    ),
                                                  ),




                                                ],
                                              ),
                                            ),

                                          ] ),

                                    ),


                                    Container(
                                      width:double.infinity,


                                      child: Padding(
                                        padding: const EdgeInsets.only(left: AppPadding.p16,top: AppPadding.p12,right: AppPadding.p16,bottom: AppPadding.p12),
                                        child: ElevatedButton(onPressed: (){

                                          if (userNameController.text
                                              .isEmpty ||
                                              userNameController.text ==
                                                  null &&
                                                  emailController.text
                                                      .isEmpty ||
                                              emailController.text ==
                                                  null && genderController.text
                                                      .isEmpty ||
                                              genderController.text ==
                                                  null) {
                                            _submit();
                                          }
                                          else{
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomnavigation()));
                                          }
                                        }, child: Text(AppString.log_out_btn,
                                            style:Theme.of(context).textTheme.bodyMedium),
                                          style: ElevatedButtonTheme.of(context).style,
                                        ),
                                      ),
                                    ),

                                  ]),
                            )
                        ),
                      )],
                  ))]));


  }
}


