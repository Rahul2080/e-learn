import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class sign extends StatefulWidget {
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  bool ischecked = false;
  bool value1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Text(
              'Let’s Sign In.!',
              style: TextStyle(
                color: Color(0xFF202244),
                fontSize: 24.sp,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            'Login to Your Account to Continue your Courses',
            style: TextStyle(
              color: Color(0xFF545454),
              fontSize: 12.sp,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: 300.w,
              height: 60.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.mail_outline),
                    Text(
                      'Email',
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: 300.w,
            height: 60.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(Icons.lock_outline),
                  Text(
                    'Password',
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                          color: Color(0xFF505050),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(width: 140.w),
                  IconButton(
                    icon: value1 == true
                        ? FaIcon(FontAwesomeIcons.eyeSlash)
                        : Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      setState(
                        () {
                          value1 = !value1;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Checkbox(
                  value: ischecked,
                  onChanged: (value) {
                    setState(
                      () {
                        ischecked = !ischecked;
                      },
                    );
                  },
                ),
                Text(
                  'Remember Me',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Color(0xFF545454),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  width: 58.w,
                ),
                Text(
                  'Forgot Password?',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Color(0xFF545454),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: 300.w,
              height: 50.h,
              decoration: ShapeDecoration(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Row(
                  children: [
                    Text(
                      'Sign Up',
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 60.w),
                    CircleAvatar(
                      radius: 25.r,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 20),
            child: Row(
              children: [
                Text(
                  'Don’t have an Account? ',
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Color(0xFF545454),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'SIGN UP',
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Color(0xFF0961F5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
