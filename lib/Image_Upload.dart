import 'dart:io';

import 'package:firebase_base/View_image.dart';
import 'package:firebase_base/login.dart';
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

  final realFirebase = FirebaseDatabase.instance.ref("Image Collection");
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
                                    Navigator.of(context).pop();
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
                                    Navigator.of(context).pop();
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
              onTap: () async {
                final id = DateTime.now().microsecondsSinceEpoch.toString();
                Reference folder= Storage.ref("/Folder name/"+id);
                UploadTask uploadtask =folder.putFile(image!.absolute);
                await Future.value(uploadtask).then((onValue) async {var newUrl= await folder.getDownloadURL();
                
                  realFirebase.child(id).set({"id":id,
                    "title" : newUrl.toString()}).then((Value) {
                      ToastMessage().toastmessage(message: "Upload Succesfully");
                      setState(() {
                        image=null;
                      });
                    
                    }).onError((error ,StackTrace) {ToastMessage().toastmessage(message: error.toString());});
                
                
                });

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
            ),SizedBox(height: 40.h,),
            GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ViewImage()));},
              child: Container(
                width: 190.w,
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
                    "View image",
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
