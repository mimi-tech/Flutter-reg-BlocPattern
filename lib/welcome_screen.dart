import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocregistrationapp/Constants/appBar.dart';
import 'package:flutterblocregistrationapp/Constants/colors.dart';
import 'package:flutterblocregistrationapp/Constants/spacing.dart';
import 'package:flutterblocregistrationapp/auth/Registration/reg_bloc.dart';
import 'package:flutterblocregistrationapp/auth/Registration/reg_form.dart';
import 'package:flutterblocregistrationapp/auth/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final getIt = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: kBlackcolor,
        appBar: AppAppBar(title:'Flutter Bloc Parten'.toUpperCase()),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome!',
            style: GoogleFonts.oxanium(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
                fontSize: 22.sp,
              ),
            ),
          ),
          Constants.spacing(context: context),

          Text(RegBloc(authRepo: context.read<RegAuthRepository>(), ).state.fullName,
            textAlign: TextAlign.center,
            style: GoogleFonts.oxanium(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
                fontSize: 22.sp,
              ),
            ),
          ),


        ],
      ),
    )));
  }
}
