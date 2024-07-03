import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
        padding: const EdgeInsets.only(left: 10,right: 3),
        child: SizedBox(height: 500,width: 450,
          child: Text(
              "This Flutter Tutorial is specifically designed for beginners and experienced professionals. It covers both the basics and advanced concepts of the Flutter framework. Flutter is Google’s Mobile SDK to build native iOS and Android apps from a single codebase. It was developed on December 4,2018.When building applications with Flutter, everything is towards Widgets – the blocks with which the Flutter apps are built. The User Interface of the app comprises many simple widgets,each handling one particular job. That is why Flutter developers tendto think of their Flutter app as a tree of devices. Compared to its contemporary technologies like React Native, Kotlin, andJava, Flutter is much better in regard to having a Single Codebase for Android and iOS, Reusable UIand Business Logic, high compatibility, performance, and productivity."
          ),
        ),
      ),
    );
  }
}
