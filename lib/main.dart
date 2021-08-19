import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterblocregistrationapp/Constants/colors.dart';
import 'package:flutterblocregistrationapp/auth/Login/login_view.dart';
import 'package:flutterblocregistrationapp/auth/auth_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: kBlackcolor,
      ),);

    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
 debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginView(),
      ),
    );

  }
}
