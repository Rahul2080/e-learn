import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  List<String> courseimg=["assets/course1.jpg","assets/course2.jpg","assets/course3.jpg","assets/course4.png","assets/course5.jpg",];
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10,top: 20,bottom: 20),
        child: SizedBox(width: 390,
          child: ListView.separated(
            itemCount: courseimg.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                width: 60.w,
                height: 250.h,
                decoration: ShapeDecoration(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),child: Image.asset(courseimg[index],fit: BoxFit.cover,),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20.h,
              );
            },
          ),
        ),
      ),
    );
  }
}
