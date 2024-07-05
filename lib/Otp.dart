import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_base/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Otp extends StatefulWidget {
  final String verification;

  const Otp({super.key, required this.verification});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: OtpTextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  numberOfFields: 6,
                  borderColor: Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) async {
                    final credentials = PhoneAuthProvider.credential(
                        verificationId: widget.verification,
                        smsCode: verificationCode);
                    try{
                      await auth.signInWithCredential(credentials);
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Home()));
                    }
                    catch(e){
                      Fluttertoast.showToast(msg: "Error");
                    }
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         title: Text("Verification Code"),
                    //         content: Text('Code entered is $verificationCode'),
                    //       );
                    //     });
                  }, // end onSubmit
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
