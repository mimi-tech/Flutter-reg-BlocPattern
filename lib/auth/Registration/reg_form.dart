import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocregistrationapp/Constants/appBar.dart';
import 'package:flutterblocregistrationapp/Constants/colors.dart';
import 'package:flutterblocregistrationapp/Constants/dimens.dart';
import 'package:flutterblocregistrationapp/Constants/spacing.dart';
import 'package:flutterblocregistrationapp/Constants/strings.dart';
import 'package:flutterblocregistrationapp/auth/Registration/reg_bloc.dart';
import 'package:flutterblocregistrationapp/auth/Registration/reg_event.dart';
import 'package:flutterblocregistrationapp/auth/Registration/reg_state.dart';
import 'package:flutterblocregistrationapp/auth/auth_repo.dart';
import 'package:flutterblocregistrationapp/auth/submitFormStatus.dart';
import 'package:flutterblocregistrationapp/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
String? userFullName;



  Widget _fullNameField() {
    return BlocBuilder<RegBloc, RegState>(builder: (context, state) {
    return Column(
        children: [
          Constants.formHint(title: kEnterFullName),
          TextFormField(
            decoration: Constants.inputDecoration,
            validator: (value) => state.isValidFullName ? null :kEnterFullName ,
      onChanged: (value) { context.read<RegBloc>().add(
      RegFullNameChanged(fullName: value),

      );
      userFullName = value;
            }
            )



        ],
      );});}

  Widget _userNameField() {
    return BlocBuilder<RegBloc, RegState>(builder: (context, state) {

      return Column(
      children: [
        Constants.formHint(title: kEnterUserName),
        TextFormField(
          decoration: Constants.inputDecoration,
          validator: (value) =>  state.isValidUsername? null:kEnterUserName,
      onChanged: (value) => context.read<RegBloc>().add(
      RegUsernameChanged(username: value),
      )),

      ],
    );});}

  Widget _emailField() {
    return BlocBuilder<RegBloc, RegState>(builder: (context, state) {
      return Column(
      children: [
        Constants.formHint(title: kEnterEmail),
        TextFormField(
          decoration: Constants.inputDecoration,
          validator:  (value) =>  state.isValidEmail? null:kEnterEmail,
      onChanged: (value) => context.read<RegBloc>().add(
      RegEmailChanged(email: value),
      )),

      ],
    );});}

  Widget _passwordField() {
    return BlocBuilder<RegBloc, RegState>(builder: (context, state) {

      return Column(
      children: [
        Constants.formHint(title: kEnterPassword),
        TextFormField(
          obscureText: true,
          decoration: Constants.inputDecoration,
          validator: (value) =>   state.isValidPassword? null:kEnterPassword,
      onChanged: (value) => context.read<RegBloc>().add(
      RegPasswordChanged(password: value),
      )),

      ],
    );});}

  Widget _regButton() {
    return BlocBuilder<RegBloc, RegState>(builder: (context, state) {

      return  state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          :ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<RegBloc>().add(RegSubmitted());

            //Push user to welcome screen
            Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));


          }
        },
        child: Text('Register'.toUpperCase(),
          style: GoogleFonts.rajdhani(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purpleAccent,
              fontSize: kFontSize.sp,

            ),
          ),
        ),
      );

  });}

    Widget regForm(){
      return BlocListener<RegBloc, RegState>(
      listener: (context, state) {
      final formStatus = state.formStatus;
      if (formStatus is SubmissionFailed) {
      _showSnackBar(context, formStatus.exception.toString());
      }
      },
      child: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _fullNameField(),
            Constants.spacing(context: context),
            _userNameField(),
            Constants.spacing(context: context),
            _emailField(),
            Constants.spacing(context: context),
            _passwordField(),
            Constants.spacing(context: context),
            _regButton()

          ],
        ),
      ),
    ));
    }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: kBlackcolor,
        appBar: AppAppBar(title:'Registration form'.toUpperCase()),
      body: BlocProvider(
        create: (context) => RegBloc(
          authRepo: context.read<RegAuthRepository>(),
        ),
        child: Column(
          children: [
            Constants.spacing(context: context),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Center(
    child:   Text('Please register here'.toUpperCase(),
        style:GoogleFonts.oxanium(
          textStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.purpleAccent,
            fontSize: 20.sp,
          ),
        ),
    ),
  ),
),
            Constants.spacing(context: context),

            regForm(),
          ],
        ),
      )
    ));
  }
  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
