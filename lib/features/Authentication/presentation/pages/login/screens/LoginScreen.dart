import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/core/extensions/extentions.dart';
import 'package:ishop/core/util/BottomNaivgation.dart';
import 'package:ishop/core/resources/strings_manger.dart';
import 'package:ishop/core/resources/values_manger.dart';
import 'package:ishop/features/Authentication/domain/entities/login_entity.dart';
import 'package:ishop/features/Authentication/presentation/Bloc/cubit/login_cubit.dart';
import '../../../../../../../core/resources/colors_manger.dart';
import '../../../../../../cofig/routes/routes.dart';
import '../../../../../../core/util/customAppBar.dart';
import '../../../../../home/presentation/bloc/products_state.dart';
import '../../../../data/model/login_requestBody.dart';
import '../../../Bloc/userLoginBloc.dart';
import '../../signUp/SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginscreenState();
}

var _formKey = GlobalKey<FormState>();
var isLoading = false;
var value = false;
bool showSpinner = false;
//
void _submit() {
  final isValid = _formKey.currentState!.validate();
  if (!isValid) {
    return;
  }
  _formKey.currentState!.save();
}

String userToken = "USERTOKENKEY";
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool ischecked = false;

bool isvisible = true;
bool rememberMe = false;

class _LoginscreenState extends State<LoginScreen> {
  void _toggle() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is RemoteNewUserDone) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.data?.message}"),
              duration: const Duration(
                  seconds: 4),
              backgroundColor:
              (state.data?.status == true)
                  ? ColorsManger.green
                  : ColorsManger.red,
            ),
            );
ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Login success")));
          }
          if (state is RemoteNewUserError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${state.error!.message ?? ""}")));
          }
        }, builder: (BuildContext context, LoginState state) {
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
                      backgroundImage: AssetImage("assets/images/logo.png"),
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
      const Center(
        child: Padding(
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
      ),
      Padding(
          padding: const EdgeInsets.only(top: 370),
          child: SingleChildScrollView(
              child: Form(
              key: _formKey,
              child: Column(children: [
                const SizedBox(height: 10),

                // Username Field

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    controller: emailController,

                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "please enter  your email";
                      } else if (!value.contains("@") || !value.contains(".")) {
                        return " please enter valide email address";
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'email Address',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),

                      hintText: AppString.emailhint,
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      //hint text style
                      labelStyle: Theme.of(context).textTheme.titleSmall,
                    ), //label style
                  ),
                ),
                // Password Field
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
                        icon: Icon(isvisible
                            ? Icons.visibility_off
                            : Icons.visibility),
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
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      //hint text style
                      labelStyle: Theme.of(context).textTheme.bodySmall,
                    ), //label style
                  ),
                ),
                // SizedBox(height: 10),

                // Remember Me and Forget Password Row
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (bool? newValue) {
                              setState(() {
                                rememberMe = newValue!;
                              });
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.blueAccent,
                          ),
                          const Text(
                            AppString.remmberMe,
                            style: TextStyle(
                                color: ColorsManger.primary, fontSize: 15),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Forgot password functionality
                        },
                        child: const Text(
                          AppString.forgetPassword,
                          style: TextStyle(
                              color: ColorsManger.primary, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 3),

                // Login Button
                TextButton(
                  onPressed: () {
                    print("we are here");
                    if (emailController.text.isEmpty ||
                        emailController.text == null &&
                            passwordController.text.isEmpty ||
                        passwordController.text == null) {
                      _submit ();
                    } else {


   context.read<LoginCubit>().onUserLogIn(
       LoginRequestBody(emailController.text,passwordController.text));
                      userNameController.clear();
                      passwordController.clear();
                      _formKey.currentState!.reset();
                      print("email${emailController.text}");
                      context.pushNamed(const BottomNavigation());
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BottomNavigation()));
                    }
                    // Login functionality
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 9),
                    backgroundColor: ColorsManger.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: ColorsManger.primary),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16, color: ColorsManger.primary),
                  ),
                ),
                // Sign up link and OR text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.New_user,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(const Signupscreen());
                        // LoginBlocLisenter();
                      },
                      child: Text(
                        AppString.register,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                Text(
                  AppString.or,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 3),

                // Social Media Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.alternate_email),
                      color: ColorsManger.primary,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.linked_camera),
                      color: ColorsManger.primary,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.facebook),
                      color: ColorsManger.primary,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.g_mobiledata),
                      color: ColorsManger.primary,
                    ),
                  ],
                ),
                Text(AppString.Sign_in_with,
                    style: Theme.of(context).textTheme.bodySmall),
              ]),
            )
          ))])
    );});
}

  void validateLogin(BuildContext context) {

      context.read<LoginCubit>().onUserLogIn(LoginRequestBody(
          context.read<LoginCubit>().emailController.text,
          context.read<LoginCubit>().passwordController.text));
  }
}

class LoginBlocLisenter extends StatelessWidget {
  const LoginBlocLisenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(listener: (context, state) {
      if (state is RemoteProductsLoading) {
        const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteNewUserError) {
        Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RemoteNewUserDone) {
        context.pushNamed(Routes.homeScreen as Widget);
      }
    });
  }
}
