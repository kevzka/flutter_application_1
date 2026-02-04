import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _db = FirebaseFirestore.instance;

Future loginUser(email, password) async {
  String message = '';
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    DocumentSnapshot data = await _db
        .collection("userData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return {
      'success' : true,
      'name' : data['name'],
      'role' : data['type'],
      'uid' : FirebaseAuth.instance.currentUser!.uid
    };
  } on FirebaseAuthException catch (e) {
    if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
      message = 'Invalid login credentials.';
    } else {
      message = e.code;
    }
    return {
      'success' : false,
      'error': message
    };
  }
}
