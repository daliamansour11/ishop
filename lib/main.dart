import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/features/Authentication/data/data_source/user_apiService.dart';
import 'package:ishop/features/Authentication/data/reposititory_imp/user_repository_imp.dart';
import 'package:ishop/features/Authentication/presentation/Bloc/userLoginBloc.dart';
import 'package:ishop/features/Authentication/presentation/Bloc/userLogin_event.dart';
import 'package:ishop/features/Authentication/presentation/pages/signUp/SignUpScreen.dart';
import 'package:ishop/features/category/presentation/bloc/category_bloc.dart';
import 'cofig/theme/themeData.dart';
import 'features/Authentication/domain/user_useCase/logedIn_UseCase.dart';
import 'features/home/presentation/bloc/products_bloc.dart';
import 'features/home/presentation/bloc/products_event.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/splash/SplashScreen.dart';
import 'injection_container.dart';
late Size mq;
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
    BlocProvider<UserLogInBloc>(

    create: (context) =>  UserLogInBloc(UesrLogedInRepositoryImp(UserApiService(Dio())),
        LogedInUseCase(UesrLogedInRepositoryImp(UserApiService(Dio())),password,userName))..add(LoginUserEvent())),
    //   //
    //   // mor_2314
    //   // 83r5^_
    BlocProvider<ProductsBloc>(
    create: (context) =>
    s1()
    ..add(const GetProducts()),
    ),
      // BlocProvider<CategoryBloc>(
      //
      //     create: (context) =>  CategoryBloc()),
    ], child:
      MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
        localizationsDelegates:const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const[
          Locale('en'), // English
          Locale('es'), // Spanish
        ],
      home: Splashscreen(),
    ) );

      // BlocProvider<NewUserBloc>(
      //
      //   create: (context) =>  NewUserBloc(),
      //   child:
      //   MaterialApp(
      //     title: '',
      //     debugShowCheckedModeBanner: false,
      //     theme: appTheme(),
      //     home: Signupscreen(),
      //   ));
  }
}