



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/cofig/routes/routes.dart';
import 'package:ishop/features/Authentication/presentation/Bloc/userLoginBloc.dart';
import 'package:ishop/features/Authentication/presentation/pages/login/screens/LoginScreen.dart';

import '../../injection_container.dart';

class AppRouter{

  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
    // BlocProvider(
    // create: (context) =>initializeDependencies<UserLogInBloc>(),
    // child:
    builder: (_)=> const LoginScreen(),
            // )
        );
        default:  return MaterialPageRoute(
            builder: (_)=>Scaffold(
              body: Center(
                child:  Text("No Route defined for${settings.name}"),
              ),

            )
        );
    }


  }
}