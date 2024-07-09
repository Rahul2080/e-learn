import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Realtimeview extends StatefulWidget {
  const Realtimeview({super.key});

  @override
  State<Realtimeview> createState() => _RealtimeviewState();
}

class _RealtimeviewState extends State<Realtimeview> {
  TextEditingController txtcontroller=TextEditingController();
  final realtimeview =FirebaseDatabase.instance.ref("Realtime");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: StreamBuilder(
                stream: realtimeview.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(snapshot.hasError){return  Center(child: Text("Error"),);}
                  if(snapshot.hasData) {

                    Map<dynamic,dynamic>map=snapshot.data!.snapshot.value as dynamic;

                    return SizedBox(height: 600.h,
                      child: ListView.builder(
                        itemCount: snapshot.data!.snapshot.children.length,
                        itemBuilder: (context, position) {

                          return ListTile(title: Text(map.values.toList()[position]["title"].toString()),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: Text("update here"),
                                        content: TextField(
                                          controller:txtcontroller ,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "Type here"),
                                          maxLines: 4,
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {

                                              realtimeview.child(map.values.toList()[position]["id"])
                                                  .update({
                                                "title": txtcontroller.text.toString()
                                              }).then((onValue) {
                                                Fluttertoast.showToast(
                                                    msg: "Update Succesfully");
                                              }).onError((error, StackTrace) {
                                                Fluttertoast.showToast(
                                                    msg: "Error");
                                              });
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Container(
                                              color: Colors.green,
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("Update"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                IconButton(
                                    onPressed: () {
                                      realtimeview.child(map.values.toList()[position]["id"].toString()).remove();

                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }else{return SizedBox();}
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
