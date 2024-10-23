import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/core/resources/BottomNaivgation.dart';
import 'package:ishop/core/resources/strings_manger.dart';
import 'package:ishop/core/resources/values_manger.dart';
import '../../../../../../core/resources/colors_manger.dart';
import '../../../../../core/util/customAppBar.dart';
import '../../../domain/entities/user_entity.dart';
import '../../Bloc/userLoginBloc.dart';
import '../../Bloc/userLogin_event.dart';
import '../../Bloc/userLogin_state.dart';


class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

var _formKey = GlobalKey<FormState>();
var isLoading = false;
var value = false;
bool showSpinner = false;

void _submit() {
  final isValid = _formKey.currentState!.validate();

  //cheek current is false
  if (!isValid) {
    return;
  }
  _formKey.currentState!.save();
}

void _toggle() {
  // setState(() {
  isvisible = !isvisible;
  // });
}

String userToken = "USERTOKENKEY";
TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool ischecked = false;
late String? email;
String? userName;
 String? password;
bool isvisible = true;
bool rememberMe = false;

class _SignupscreenState extends State<Signupscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Stack(children: [
          ClipPath(
            clipper: CustomClipperExample1(),
            child: Container(
              color: ColorsManger.lightPrimary,
              width: size.width,
              height: 300,
              child: Center(
                child: Text(
                  "Clipped Shape",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: CustomClipperExample(),
            child: Container(
              color: ColorsManger.primary,
              width: size.width,
              height: 297,
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
          const Padding(
            padding: EdgeInsets.only(bottom: AppPadding.p91),
            child: Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorsManger.primary,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 370),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userNameController,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return AppString.invaliduserNamehint;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          // (value) => context.read<NewUserBloc>().add,
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "UserName",
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),

                          hintText: AppString.userNamehint,

                          // contentPadding: EdgeInsets
                          //     .symmetric(
                          //     vertical: AppSize.s1, horizontal: AppSize.s5),
                          //hint text
                          suffixIcon: IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              userNameController.clear();
                            },
                          ),
                          //prefix iocn
                          hintStyle: Theme
                              .of(context)
                              .textTheme
                              .bodySmall,
                          //hint text style
                          labelStyle: Theme
                              .of(context)
                              .textTheme
                              .titleSmall,
                        ), //label style
                      ),

                      const SizedBox(height: 10),

                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                      //   child: TextFormField(
                      //     controller: emailController,
                      //
                      //     obscureText: false,
                      //     validator: (value) {
                      //       if (value!.isEmpty || value == null) {
                      //         return "please enter  your email";
                      //       } else if (!value.contains("@") || !value.contains(".")) {
                      //         return " please enter valide email address";
                      //       }
                      //       return null;
                      //     },
                      //     onChanged: (value) {},
                      //     keyboardType: TextInputType.emailAddress,
                      //     decoration: InputDecoration(
                      //       labelText: 'Email Address',
                      //       border: const OutlineInputBorder(
                      //         borderRadius: BorderRadius.all(Radius.circular(30)),
                      //       ),
                      //
                      //       hintText: AppString.emailhint,
                      //       hintStyle: Theme.of(context).textTheme.bodySmall,
                      //       //hint text style
                      //       labelStyle: Theme.of(context).textTheme.titleSmall,
                      //     ), //label style
                      //   ),
                      // ),
                      // Password Field
                      const SizedBox(height: 10),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: isvisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please password is required";
                            } else if (value.length < 8) {
                              return "password should be 8 character or more characters";
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                  isvisible ? Icons.visibility_off : Icons
                                      .visibility),
                              onPressed: _toggle,
                            ),
                            hintText: AppString.passwordhint,

                            // contentPadding: EdgeInsets
                            //     .symmetric(
                            //     vertical: AppSize.s1, horizontal: AppSize.s5),
                            //hint text
                            labelText: "Password",
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30)),
                            ),

                            //prefix iocn
                            hintStyle: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                            //hint text style
                            labelStyle: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                          ), //label style
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: () {
                          final name = userNameController.text;
                          final password = passwordController.text;
                          if (name.isEmpty ||
                              name == null &&
                                  password.isEmpty ||
                              password == null) {
                            _submit();
                          } else {
                            context.read<UserLogInBloc>().add(LoginUserEvent(
                              name: name,
                              password: password,
                            ));
                            // mor_2314
                            // 83r5^_

                            userNameController.clear();
                            passwordController.clear();
                            _formKey.currentState!.reset();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (
                                    context) => const BottomNavigation()));
                          }
                        },
                        child: Text('Sign Up'),),

                      // sign up functionality

                      // Dispatch the signup event


                    ],
                  ),
                ),
              )
          ),

        ]));
  }

  _signUp() {
    return BlocListener<UserLogInBloc, UserState>(
      listener: (context, state) {
        if (state is RemoteNewUserDone) {
          // Navigate to next screen or show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Signup Successful!')),
          );
        } else if (state is RemoteNewUserError) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${state.error}")));
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: userNameController,
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return AppString.invaliduserNamehint;
                }
                return null;
              },
              onChanged: (value) {
                // (value) => context.read<NewUserBloc>().add,
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "UserName",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),

                hintText: AppString.userNamehint,

                // contentPadding: EdgeInsets
                //     .symmetric(
                //     vertical: AppSize.s1, horizontal: AppSize.s5),
                //hint text
                suffixIcon: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    userNameController.clear();
                  },
                ),
                //prefix iocn
                hintStyle: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
                //hint text style
                labelStyle: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ), //label style
            ),

            const SizedBox(height: 10),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10.0),
            //   child: TextFormField(
            //     controller: emailController,
            //
            //     obscureText: false,
            //     validator: (value) {
            //       if (value!.isEmpty || value == null) {
            //         return "please enter  your email";
            //       } else if (!value.contains("@") || !value.contains(".")) {
            //         return " please enter valide email address";
            //       }
            //       return null;
            //     },
            //     onChanged: (value) {},
            //     keyboardType: TextInputType.emailAddress,
            //     decoration: InputDecoration(
            //       labelText: 'Email Address',
            //       border: const OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(30)),
            //       ),
            //
            //       hintText: AppString.emailhint,
            //       hintStyle: Theme.of(context).textTheme.bodySmall,
            //       //hint text style
            //       labelStyle: Theme.of(context).textTheme.titleSmall,
            //     ), //label style
            //   ),
            // ),
            // Password Field
            const SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: isvisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please password is required";
                  } else if (value.length < 8) {
                    return "password should be 8 character or more characters";
                  }
                  return null;
                },
                onChanged: (value) {},
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                        isvisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: _toggle,
                  ),
                  hintText: AppString.passwordhint,

                  // contentPadding: EdgeInsets
                  //     .symmetric(
                  //     vertical: AppSize.s1, horizontal: AppSize.s5),
                  //hint text
                  labelText: "Password",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),

                  //prefix iocn
                  hintStyle: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                  //hint text style
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ), //label style
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                final name = userNameController.text;
                final password = passwordController.text;
                if (name.isEmpty ||
                    name == null &&
                        password.isEmpty ||
                    password == null) {
                  _submit();
                } else {
                  context.read<UserLogInBloc>().add(LoginUserEvent(
                    name: name,
                    password: password,
                  ));
                  // mor_2314
                  // 83r5^_

                  userNameController.clear();
                  passwordController.clear();
                  _formKey.currentState!.reset();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigation()));
                }
              },
              child: Text('Sign Up'),),

            // sign up functionality

            // Dispatch the signup event


          ],
        ),
      ),
    );
    //     BlocListener<NewUserBloc, UserState>(
    //       listener: (context, state) {
    //     if (state is RemoteNewUserError) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text('Signup Failed')),
    //       );
    //     } else if (state is RemoteNewUserDone) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text('Signup Successful')),
    //       );
    //     }
    //   }, child: BlocBuilder<NewUserBloc, UserState>(
    //       builder: (context, state) {
    //         return   Column(children: [
    //           const SizedBox(height: 10),
    //           // Username Field
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 10.0),
    //             child: TextFormField(
    //               controller: userNameController,
    //               obscureText: false,
    //               validator: (value) {
    //                 if (value!.isEmpty || value == null) {
    //                   return AppString.invaliduserNamehint;
    //                 }
    //                 return null;
    //               },
    //               onChanged: (value) {
    //                     // (value) => context.read<NewUserBloc>().add,
    //               },
    //               keyboardType: TextInputType.text,
    //               decoration: InputDecoration(
    //                 labelText: "UserName",
    //                 border: const OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(30)),
    //                 ),
    //
    //                 hintText: AppString.userNamehint,
    //
    //                 // contentPadding: EdgeInsets
    //                 //     .symmetric(
    //                 //     vertical: AppSize.s1, horizontal: AppSize.s5),
    //                 //hint text
    //                 suffixIcon: IconButton(
    //                   icon: Icon(Icons.check),
    //                   onPressed: () {
    //                     userNameController.clear();
    //                   },
    //                 ),
    //                 //prefix iocn
    //                 hintStyle: Theme.of(context).textTheme.bodySmall,
    //                 //hint text style
    //                 labelStyle: Theme.of(context).textTheme.titleSmall,
    //               ), //label style
    //             ),
    //           ),
    //           const SizedBox(height: 10),
    //
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 10.0),
    //             child: TextFormField(
    //               controller: emailController,
    //
    //               obscureText: false,
    //               validator: (value) {
    //                 if (value!.isEmpty || value == null) {
    //                   return "please enter  your email";
    //                 } else if (!value.contains("@") || !value.contains(".")) {
    //                   return " please enter valide email address";
    //                 }
    //                 return null;
    //               },
    //               onChanged: (value) {},
    //               keyboardType: TextInputType.emailAddress,
    //               decoration: InputDecoration(
    //                 labelText: 'Email Address',
    //                 border: const OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(30)),
    //                 ),
    //
    //                 hintText: AppString.emailhint,
    //                 hintStyle: Theme.of(context).textTheme.bodySmall,
    //                 //hint text style
    //                 labelStyle: Theme.of(context).textTheme.titleSmall,
    //               ), //label style
    //             ),
    //           ),
    //           // Password Field
    //           const SizedBox(height: 10),
    //
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 10.0),
    //             child: TextFormField(
    //               controller: passwordController,
    //               obscureText: isvisible,
    //               validator: (value) {
    //                 if (value == null || value.isEmpty) {
    //                   return "please password is required";
    //                 } else if (value.length < 8) {
    //                   return "password should be 8 character or more characters";
    //                 }
    //                 return null;
    //               },
    //               onChanged: (value) {},
    //               keyboardType: TextInputType.visiblePassword,
    //               decoration: InputDecoration(
    //                 suffixIcon: IconButton(
    //                   icon: Icon(
    //                       isvisible ? Icons.visibility_off : Icons.visibility),
    //                   onPressed: _toggle,
    //                 ),
    //                 hintText: AppString.passwordhint,
    //
    //                 // contentPadding: EdgeInsets
    //                 //     .symmetric(
    //                 //     vertical: AppSize.s1, horizontal: AppSize.s5),
    //                 //hint text
    //                 labelText: "Password",
    //                 border: const OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(30)),
    //                 ),
    //
    //                 //prefix iocn
    //                 hintStyle: Theme.of(context).textTheme.bodySmall,
    //                 //hint text style
    //                 labelStyle: Theme.of(context).textTheme.bodySmall,
    //               ), //label style
    //             ),
    //           ),
    //           // SizedBox(height: 10),
    //
    //           // Remember Me and Forget Password Row
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   children: [
    //                     Checkbox(
    //                       value: rememberMe,
    //                       onChanged: (bool? newValue) {
    //                         setState(() {
    //                           rememberMe = newValue!;
    //                         });
    //                       },
    //                       activeColor: Colors.white,
    //                       checkColor: Colors.blueAccent,
    //                     ),
    //                     const Text(
    //                       AppString.acceptterms,
    //                       style: TextStyle(
    //                           color: ColorsManger.primary, fontSize: 15),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //           // SizedBox(height: 3),
    //
    //           // Login Button
    //           TextButton(
    //             onPressed: () {
    //               if (userNameController.text.isEmpty ||
    //                   userNameController.text == null &&
    //                       passwordController.text.isEmpty ||
    //                   passwordController.text == null) {
    //                 _submit();
    //               } else {
    //                 var user = UserEntity(
    //                     username: userNameController.text,
    //                     email: emailController.text,
    //                     password: passwordController.text);
    //                 userNameController.clear();
    //                 passwordController.clear();
    //                 _formKey.currentState!.reset();
    //                 // sign up functionality
    //                 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BottomNavigation()));
    //               }
    //             },
    //             style: TextButton.styleFrom(
    //               padding: EdgeInsets.symmetric(horizontal: 100, vertical: 9),
    //               backgroundColor: ColorsManger.white,
    //               shape: RoundedRectangleBorder(
    //                 side: const BorderSide(color: ColorsManger.primary),
    //                 borderRadius: BorderRadius.circular(30),
    //               ),
    //             ),
    //             child: const Text(
    //               AppString.register,
    //               style: TextStyle(fontSize: 16, color: ColorsManger.primary),
    //             ),
    //           ),
    //           // Sign up link and OR text
    //
    //           Text(
    //             AppString.or,
    //             style: Theme.of(context).textTheme.bodySmall,
    //           ),
    //           const SizedBox(height: 3),
    //           // Social Media Buttons
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               IconButton(
    //                 onPressed: () {},
    //                 icon: const Icon(Icons.alternate_email),
    //                 color: ColorsManger.primary,
    //               ),
    //               IconButton(
    //                 onPressed: () {},
    //                 icon: const Icon(Icons.linked_camera),
    //                 color: ColorsManger.primary,
    //               ),
    //               IconButton(
    //                 onPressed: () {},
    //                 icon: const Icon(Icons.facebook),
    //                 color: ColorsManger.primary,
    //               ),
    //               IconButton(
    //                 onPressed: () {},
    //                 icon: const Icon(Icons.g_mobiledata),
    //                 color: ColorsManger.primary,
    //               ),
    //             ],
    //           ),
    //           Text(AppString.Sign_in_with,
    //               style: Theme.of(context).textTheme.bodySmall),
    //         ]);
    //   }
    // ));
  }
}
