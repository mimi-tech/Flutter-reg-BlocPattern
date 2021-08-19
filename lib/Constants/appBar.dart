import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterblocregistrationapp/Constants/colors.dart';
import 'package:flutterblocregistrationapp/Constants/dimens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAppBar extends StatefulWidget implements PreferredSizeWidget{
  AppAppBar({required this.title});
  final String title;
  @override
  _AppAppBarState createState() => _AppAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}

class _AppAppBarState extends State<AppAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBlackcolor,
      title: Text(widget.title,
       style: GoogleFonts.oxanium(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purpleAccent,
            fontSize: 22.sp,
          ),
        ),
      ),
    );
  }
}
