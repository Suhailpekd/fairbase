import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newapp/Mywiiii.dart';
import 'package:newapp/view.dart';

class View2 extends StatefulWidget {
  var docs66;
  var name1;
  var mob;
  var password;
  var id1;
  View2(
      {super.key,
      required this.docs66,
      required this.name1,
      required this.mob,
      required this.password,
      required this.id1});

  @override
  State<View2> createState() => _View2State();
}

class _View2State extends State<View2> {
  var user1 = TextEditingController();
  var user2 = TextEditingController();
  var user3 = TextEditingController();
  var user4 = TextEditingController();
  @override
  void initState() {
    user1 = TextEditingController(text: widget.docs66);
    user2 = TextEditingController(text: widget.name1);
    user3 = TextEditingController(text: widget.mob);
    user4 = TextEditingController(text: widget.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
            TextFormField(
              controller: user1,
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
            ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("teacher")
                      .doc(widget.id1)
                      .update({
                    "email": user1.text,
                    "mob": user2.text,
                    "password": user3.text,
                    "teacher": user4.text,
                  });
                  setState(() {});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Mywid
                        (),
                      ));
                },
                child: Text("update"))
          ],
        ),
      ),
    ));
  }
}
