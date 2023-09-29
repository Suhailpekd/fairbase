import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newapp/view.dart';

class Mywid extends StatefulWidget {
  const Mywid({super.key});

  @override
  State<Mywid> createState() => _MywidState();
}

class _MywidState extends State<Mywid> {
  var user = TextEditingController();
  var user2 = TextEditingController();
  var user3 = TextEditingController();
  var user4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                TextFormField(
                  controller: user,
                ),
                TextFormField(
                  controller: user2,
                ),
                TextFormField(
                  controller: user3,
                ),
                TextFormField(
                  controller: user4,
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                if (user.text.isEmpty ||
                    user2.text.isEmpty ||
                    user3.text.isEmpty ||
                    user4.text.isEmpty) {
                  print("empty field type somthing");
                } else {
                  await FirebaseFirestore.instance.collection("teacher").add({
                    "email": user.text,
                    "mob": user2.text,
                    "password": user3.text,
                    "teacher": user4.text,
                  }).then((value) => print("success"));
                }
              },
              child: Text("data")),
          ElevatedButton(
              onPressed: () async {
                {
                  await FirebaseFirestore.instance
                      .collection("teacher")
                      .get()
                      .then(
                    (snapshot) {
                      List<QueryDocumentSnapshot> docList = snapshot.docs;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => View1(docs11: docList)));
                    },
                  );
                }
              },
              child: Text("view"))
        ],
      ),
    );
  }
}
