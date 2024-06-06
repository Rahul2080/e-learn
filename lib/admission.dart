
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class Admission extends StatefulWidget {
  const Admission({super.key});

  @override
  State<Admission> createState() => _AdmissionState();
}

class _AdmissionState extends State<Admission> {
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Fill Admission Details",
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
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Container(
                width: 360,
                height: 60,
                decoration: ShapeDecoration(color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Student name")),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(top: 20,left: 20),
              child: Container(
                width: 360,
                height: 60,
                decoration: ShapeDecoration(color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Parent Name")),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(top: 20,left: 20),
              child: Container(
                width: 360,
                height: 60,
                decoration: ShapeDecoration(color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),),
                child:  DateTimeField(decoration:InputDecoration(border:OutlineInputBorder(),label: Text("date of birth")),
                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                  },
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(top: 20,left: 20),
              child: Container(
                width: 360,
                height: 60,
                decoration: ShapeDecoration(color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),),
                child: TextField(keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Mobile number")),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(top: 20,left: 20),
              child: Container(
                width: 360,
                height: 60,
                decoration: ShapeDecoration(color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email id")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
