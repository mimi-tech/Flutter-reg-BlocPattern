import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocregistrationapp/Constants/appBar.dart';
import 'package:flutterblocregistrationapp/Constants/spacing.dart';
import 'package:flutterblocregistrationapp/Constants/strings.dart';
import 'package:flutterblocregistrationapp/auth/Login/login_bloc.dart';
import 'package:flutterblocregistrationapp/auth/Login/login_event.dart';
import 'package:flutterblocregistrationapp/auth/Login/login_state.dart';
import 'package:flutterblocregistrationapp/auth/Registration/reg_form.dart';
import 'package:flutterblocregistrationapp/auth/auth_repo.dart';
import 'package:flutterblocregistrationapp/auth/submitFormStatus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterblocregistrationapp/welcome_screen.dart';
import '../../Constants/colors.dart';
import '../../Constants/dimens.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlackcolor,
        appBar: AppAppBar(title:'login form'.toUpperCase()),
        body: BlocProvider(
          create: (context) => LoginBloc(
            authRepo: context.read<AuthRepository>(),
          ),
          child: Column(
            children: [
              _loginForm(context),
              Constants.spacing(context: context),
              GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForm()));
               },
               child: RichText(
               textAlign: TextAlign.end,
                 text: TextSpan(
                   text: kSignUpText,
                   style: GoogleFonts.oxanium(
                     textStyle: TextStyle(
                       fontWeight: FontWeight.normal,
                       color: kBlackcolor,
                       fontSize: kFontSize14.sp,
                     ),
                   ),
                   children: <TextSpan>[
                     TextSpan(
                       text: kSignUpText2.toUpperCase(),
                       style: GoogleFonts.rajdhani(
                         textStyle: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: kMaincolor,
                           fontSize: kFontSize.sp,

                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
              Constants.spacing(context: context),

            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final formStatus = state.formStatus;

          if (formStatus is SubmissionFailed) {
            _showSnackBar(context, formStatus.exception.toString());
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));

          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _usernameField(),
                Constants.spacing(context: context),
                _passwordField(),
                Constants.spacing(context: context),
                _loginButton(),
              ],
            ),
          ),
        ));
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Column(
        children: [
          Constants.formHint(title: kEnterUserName),
          TextFormField(
            decoration: Constants.inputDecoration,
            validator: (value) =>
            state.isValidUsername ? null : 'Username is too short',
            onChanged: (value) => context.read<LoginBloc>().add(
              LoginUsernameChanged(username: value),
            ),
          ),
        ],
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Column(
        children: [
          Constants.formHint(title: kEnterPassword),
          TextFormField(
            obscureText: true,
            decoration: Constants.inputDecoration,
            validator: (value) =>
            state.isValidPassword ? null : 'Password is too short',
            onChanged: (value) => context.read<LoginBloc>().add(
              LoginPasswordChanged(password: value),
            ),
          ),
        ],
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<LoginBloc>().add(LoginSubmitted());
          }
        },
        child: Text('Login'.toUpperCase(),
          style: GoogleFonts.rajdhani(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purpleAccent,
              fontSize: kFontSize.sp,

            ),
          ),
        ),
      );
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}