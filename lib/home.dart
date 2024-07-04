import 'package:firebase_base/Course.dart';
import 'package:firebase_base/about.dart';
import 'package:firebase_base/admission.dart';
import 'package:firebase_base/contact.dart';
import 'package:firebase_base/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> txt = ["Admission", "Students login", "Courses","Contact", "About"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.red,
          ),
          SizedBox(height: 30),
          GridView.count(
            crossAxisCount: 2,physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            children: List.generate(
              txt.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      if(index==0){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Admission()));
                      }
                      if(index==1){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Student()));
                      }
                      if(index==2){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Course()));
                      }
                      if(index==3){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Contact()));
                      }
                      if(index==4){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => About()));
                      }

                    },
                    child: Container(
                      width: 250,
                      height: 180,
                      decoration: ShapeDecoration(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person,
                            size: 100,
                          ),
                          Text(
                            txt[index],textAlign: TextAlign.center,
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
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
