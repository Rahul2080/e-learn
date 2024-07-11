import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewImage extends StatefulWidget {
  const ViewImage({super.key});

  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  final realFirebase = FirebaseDatabase.instance.ref("Image Collection");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 690.h,width: 350.w,
              child: StreamBuilder(
                stream: realFirebase.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.hasError){
                    return Center(child: Text("Error",style: TextStyle(color: Colors.white),),);
                  }
                  if(snapshot.hasData){
                    Map<dynamic , dynamic>? map=snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;
                    if (map==null || map.isEmpty){
                      return Center(child: Text("No image required"));
                    }
                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    children: List.generate(
                      snapshot.data!.snapshot.children.length,
                      (index) {
                        return Container(
                          decoration: BoxDecoration(color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),child: Image.network(map.values.toList()[index]["title"].toString()),
                        );
                      },
                    ),
                  );
                }else{return SizedBox();}}
              ),
            ),
          ],
        ),
      ),
    );
  }
}
