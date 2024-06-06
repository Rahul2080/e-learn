import 'package:firebase_base/sign.dart';
import 'package:firebase_base/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool ischeck = false;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text(
          "Auto mobiles",
          style: GoogleFonts.mulish(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: Text(
                'Getting Started.!',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Color(0xFF202244),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Create an Account to Continue your allCourses',
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Color(0xFF545454),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                width: 300.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      labelText: "Student id"),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: 300.w,
              height: 50.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  labelText: "Password",
                  suffix: IconButton(
                    icon: value == true
                        ? FaIcon(FontAwesomeIcons.eyeSlash)
                        : Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      setState(
                        () {
                          value = !value;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 12,
                    child: Checkbox(
                      checkColor: Colors.green,
                      activeColor: Colors.white,
                      value: ischeck,
                      shape: CircleBorder(),
                      onChanged: (value) {
                        setState(
                          () {
                            ischeck = !ischeck;
                          },
                        );
                      },
                    ),
                  ),
                  Text(
                    'Agree to Terms & Conditions',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Color(0xFF545454),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Student()));
                },
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
                          'Login',
                          style: GoogleFonts.jost(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 91.w),
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 69, top: 20),
              child: Row(
                children: [
                  Text(
                    'Already have an Account? ',
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Color(0xFF545454),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Sign()));
                    },
                    child: Text(
                      'SIGN IN',
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Color(0xFF0961F5),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
