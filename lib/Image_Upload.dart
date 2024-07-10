import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print("hello" + pickedFile.path);
      } else {
        print("No image Picked");
      }
    });
  }

  Future getImageCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print("hello" + pickedFile.path);
      } else {
        print("No image Picked");
      }
    });
  }

  final realFirebase = FirebaseDatabase.instance;
  final Storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 130.h,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    getImageCamera();
                                  },
                                  child: Container(
                                    width: 100.w,
                                    height: 80.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          Text(
                                            "Take a Photo",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 50.w),
                                GestureDetector(
                                  onTap: () {
                                    getImageGallery();
                                  },
                                  child: Container(
                                    width: 100.w,
                                    height: 80.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.insert_photo,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                          Text(
                                            "Gallery",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 340.w,
                  height: 260.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Opacity(
                      opacity: .7,
                      child: image != null
                          ? Image.file(image!.absolute)
                          : Icon(
                              Icons.photo,
                              size: 50,
                            )),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            GestureDetector(
              onTap: () {
                final id = DateTime.now().microsecondsSinceEpoch.toString();


              },
              child: Container(
                width: 160.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Upload",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 26.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
