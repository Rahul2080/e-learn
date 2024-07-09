import 'package:firebase_base/RealtimeView.dart';
import 'package:firebase_base/login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RealtimeHome extends StatefulWidget {
  const RealtimeHome({super.key});

  @override
  State<RealtimeHome> createState() => _RealtimeHomeState();
}

class _RealtimeHomeState extends State<RealtimeHome> {
  TextEditingController txt = TextEditingController();
  final realtime = FirebaseDatabase.instance.ref("Realtime");

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
            child: TextField(controller: txt,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              maxLines: 9,
            ),
          ), SizedBox(height: 60.h,),
          GestureDetector(onTap: () {
            final Realid = DateTime
                .now()
                .microsecondsSinceEpoch
                .toString();
            realtime.child(Realid).set({"title": txt.text, "id": Realid}).then((
                onValue) {
              txt.clear();
              ToastMessage().toastmessage(message: "Enter Succesfully ");
            }).onError((error, StackTrace){

              ToastMessage().toastmessage(message: error.toString());

            });
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
          ), SizedBox(height: 30.h),
          GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Realtimeview()));},
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
        ],
      ),
    ));;
  }
}
