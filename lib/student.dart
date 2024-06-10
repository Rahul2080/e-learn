import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Auto mobiles",
          textAlign: TextAlign.center,
          style: GoogleFonts.mulish(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      body: Container(
        width: 100.w,
        height: 80.h,
        color: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 190.h,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    Text(
                      "Sreeyesh",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(
                      "Sreeyesh@gmail.com",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 10.w,
              height: 40.h,
              color: Colors.white54,
              child: Text(
                "Videos",
                textAlign: TextAlign.center,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 100.w,
              height: 40.h,
              color: Colors.white54,
              child: Text(
                "Messages",
                textAlign: TextAlign.center,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 100.w,
              height: 40.h,
              color: Colors.white54,
              child: Text(
                "Pay fee",
                textAlign: TextAlign.center,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 100.w,
              height: 40.h,
              color: Colors.white54,
              child: Text(
                "Study Materials",
                textAlign: TextAlign.center,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),SizedBox(height: 10.h,),
            Container(
              width: 100.w,
              height: 40.h,
              color: Colors.white54,
              child: Text(
                "Attendance",
                textAlign: TextAlign.center,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 100.w,
              height: 40.h,
              color: Colors.white54,
              child: Text(
                "Examination Schedule",
                textAlign: TextAlign.center,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 100.w,
              height: 40.h,
              color: Colors.white54,
              child: Text(
                "Log Out",
                textAlign: TextAlign.center,
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
