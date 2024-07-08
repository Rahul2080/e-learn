import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

final Firestore = FirebaseFirestore.instance.collection("Post").snapshots();

class _ReadState extends State<Read> {
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
                          return ListTile(title: Text( snapshot.data!.docs[position]["title"]
                              .toString(),),trailing: Wrap(
                                children: [
                                  IconButton( onPressed: () { AlertDialog(
                                    title: Text('Welcome'),		 // To display the title it is optional
                                    content:TextField(),
                                    actions: [
                                     TextButton(onPressed: () {}, child: Text("Sumbit"),)
                                    ],
                                  );
                                  }, icon: Icon(Icons.edit),),SizedBox(width: 20.w,),


                                Icon(Icons.delete)],
                              ), );
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
