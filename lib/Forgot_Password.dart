import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_base/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 160, left: 20, right: 20),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter your Email"),
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              width: 130.w,
              height: 40.h,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: GestureDetector(onTap: () {
                  auth.sendPasswordResetEmail(email: email.text).then((
                      onValue) {
                    ToastMessage().toastmessage(
                        message: "Reset link sent to your email");
                  }).onError((error, StackTrace){ToastMessage().toastmessage(message: error.toString());});
                },
                  child: Text(
                    "Reset",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
