import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  TextEditingController controller = TextEditingController();
  final Firestore = FirebaseFirestore.instance.collection("Post").snapshots();
  final ref = FirebaseFirestore.instance.collection("Post");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 800.h,
              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Error",
                          style: TextStyle(color: Colors.blue),
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, position) {
                          return ListTile(
                            title: Text(
                              snapshot.data!.docs[position]["title"].toString(),
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: Text("update here"),
                                        content: TextField(
                                          controller: controller,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "Type here"),
                                          maxLines: 4,
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              ref
                                                  .doc(snapshot.data!
                                                      .docs[position]["id"]
                                                      .toString())
                                                  .update({
                                                "title": controller.text
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
                                      ref
                                          .doc(snapshot
                                              .data!.docs[position]["id"]
                                              .toString())
                                          .delete();
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
