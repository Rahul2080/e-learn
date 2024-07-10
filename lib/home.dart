import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_base/Image_Upload.dart';
import 'package:firebase_base/Read%20data.dart';
import 'package:firebase_base/RealTime_Home.dart';
import 'package:firebase_base/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {

  List<String> txt = [
    "Admission",
    "Students login",
    "Courses",
    "Contact",
    "About"
  ];


  TextEditingController text = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection("Post");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
                child: TextField(controller: text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  maxLines: 9,
                ),
              ), SizedBox(height: 60.h,),
              GestureDetector(onTap: () {
                final id = DateTime
                    .now()
                    .microsecondsSinceEpoch
                    .toString();
                firestore.doc(id).set({ "title": text.text, "id": id}).then((
                    onValue)
                {
                  text.clear();
                  ToastMessage().toastmessage(message: "text.added");
                }).onError((error, StackTrace) =>
                    ToastMessage().toastmessage(message: error.toString()));
              },
                child: Container(
                  width: 90.w,
                  height: 40.h,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    "ADD",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25.sp),
                  ),
                ),
              ),SizedBox(height: 30.h),
              GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Read()));},
                child: Container(
                  width: 150.w,
                  height: 40.h,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    "See more",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25.sp),
                  ),
                ),
              ),
SizedBox(height: 50.h,),
              GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RealtimeHome()));},
                child: Container(
                  width: 200.w,
                  height: 40.h,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    "Real Time",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25.sp),
                  ),
                ),
              ),
              SizedBox(height: 50.h,),
              GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ImageUpload()));},
                child: Container(
                  width: 200.w,
                  height: 40.h,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    "Image",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25.sp),
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
