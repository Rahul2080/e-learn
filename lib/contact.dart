import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "CONTACT DETAILS",
            textAlign: TextAlign.center,
            style: GoogleFonts.mulish(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,right: 30),
            child: Text(
              "Ash crop institute, \n ops mall, vayilathoor ,Tirur \n malapuram District \n pincode - 678689  \n  ashcrop@gmail.com  \n www.ashcrop .com",
              textAlign: TextAlign.start,
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60,left: 40),
            child: Container(
              width: 280.w,
              height: 60.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "assets/whatapp.jpg",
                      ),
                    ),SizedBox(width: 30.w),
                    Text(
                      "9988776655",
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
