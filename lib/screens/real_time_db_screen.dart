import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
// DatabaseReference ref = FirebaseDatabase.instance.ref();

class rltdbScreen extends StatefulWidget {
  const rltdbScreen({super.key});

  @override
  State<rltdbScreen> createState() => _rltdbScreenState();
}

class _rltdbScreenState extends State<rltdbScreen> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      writeData();
    }, child: Text("Write Data"));
  }
}

Future writeData() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
  // await ref.set({
  //   "name": "John",
  //   "age": 18,
  //   "address": {"line1": "100 Mountain View"},
  // });
  await ref.update({
  "age": 19,
});
}
