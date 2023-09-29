import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newapp/vvvvvvv.dart';

class View1 extends StatefulWidget {
  final List<QueryDocumentSnapshot> docs11;
  const View1({super.key, required this.docs11});

  @override
  State<View1> createState() => _View1State();
}

class _View1State extends State<View1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.docs11.length,
        itemBuilder: (context, index) => ListTile(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => View2(
                          docs66: widget.docs11[index]["teacher"],
                          name1: widget.docs11[index]["email"],
                          mob: widget.docs11[index]["email"],
                          password: widget.docs11[index]["password"],
                          id1: widget.docs11[index].id))));
            },
            icon: Icon(Icons.add),
          ),
          title: Text(widget.docs11[index]["teacher"].toString()),
          subtitle: Text(widget.docs11[index]["email"].toString()),
          trailing: InkWell(
              onTap: () {
                widget.docs11[index].reference.delete();
                setState(() {
                  widget.docs11.removeAt(index);
                });
              },
              child: Icon(Icons.delete)),
        ),
      ),
    );
  }
}
