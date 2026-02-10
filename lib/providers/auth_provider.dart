// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final _db = FirebaseFirestore.instance;
final supabase = Supabase.instance.client;


// Future loginUser(email, password) async {
//   String message = '';
//   try {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     DocumentSnapshot data = await _db
//         .collection("userData")
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .get();
//     return {
//       'success' : true,
//       'name' : data['name'],
//       'role' : data['type'],
//       'uid' : FirebaseAuth.instance.currentUser!.uid
//     };
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
//       message = 'Invalid login credentials.';
//     } else {
//       message = e.code;
//     }
//     return {
//       'success' : false,
//       'error': message
//     };
//   }
// }

Future signInUser(username, password) async {
  try{
  final AuthResponse res = await supabase.auth.signUp(
  email: 'kevinapta99@gmail.com',
  password: 'example-password',
  );
  final Session? session = res.session;

  final User? user = res.user;
  await supabase
    .from('users')
    .insert({'uid': user!.id, 'role': 'admin', 'display_name': 'vano'});
    
  print(session!);
  print(user!);
  return {
      'success' : true,
    };
  }catch(e){
    print(e);
  }
}
