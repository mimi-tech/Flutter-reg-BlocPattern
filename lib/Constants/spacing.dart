import 'package:flutter/material.dart';
import 'package:flutterblocregistrationapp/Constants/colors.dart';
import 'package:flutterblocregistrationapp/Constants/dimens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants{
  static Widget spacing({@required context}){
    return SizedBox(height: MediaQuery.of(context).size.height * 0.02,);
  }

  static Widget formHint({@required title}){
    return Text(title,
      style: GoogleFonts.rajdhani(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white38,
          fontSize: kFontSize.sp,

        ),
      ),
    );
  }


  static final inputDecoration = InputDecoration(
      errorStyle: GoogleFonts.rajdhani(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontSize: kFontSize.sp,

        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white38,width: 4.0)
      ),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purpleAccent,width: 4.0)));

}