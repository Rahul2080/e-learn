import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_base/Phone.dart';
import 'package:firebase_base/home.dart';
import 'package:firebase_base/sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool ischeck = false;
  bool value = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110),
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
              padding: const EdgeInsets.only(top: 50),
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
                  controller: email,
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
                controller: password,
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
              padding: const EdgeInsets.only(top: 30),
              child: TextButton(
                onPressed: () {
                  auth
                      .signInWithEmailAndPassword(
                          email: email.text, password: password.text)
                      .then((value) => {
                            Fluttertoast.showToast(
                                msg: " Successfully registerd",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0),
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) => Home()))
                          })
                      .onError((error, stackTrace) => ToastMessage()
                          .toastmessage(message: error.toString()));
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
                        SizedBox(width: 75.w),
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
            Text(
              'or continue with ',
              style: GoogleFonts.mulish(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 126, top: 10),
              child: Row(
                children: [
                  GestureDetector(onTap: (){
                    signInwithGoogle();
                    
                    
                    },
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.white,
                      child: SizedBox(
                          width: 42,
                          height: 45,
                          child: Image.asset("assets/google.jpg")),
                    ),
                  ),
                  SizedBox(width: 25.w),
                  GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Phone()));},
                    child: CircleAvatar(
                        radius: 27.r,
                        backgroundColor: Colors.white,
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset("assets/phone.jpg"))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 69, top: 20),
              child: Row(
                children: [
                  Text(
                    'Don’t have an Account? ',
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Color(0xFF545454),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Sign()));
                    },
                    child: Text(
                      'SIGN UP',
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

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.signInWithCredential(credential).then((onValue)=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Home())));
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}

class ToastMessage {
  toastmessage({required String message}) {
    Fluttertoast.showToast(msg: message);
  }
}
