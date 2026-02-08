import 'package:firebase_database/firebase_database.dart';

Future writeLocation(user, {latitude, longitude}) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref(user);
  await ref.update({"latitude": latitude, "longitude": longitude});
}

Future readLocation(user) async {
  DatabaseReference starCountRef = FirebaseDatabase.instance.ref(user);
  return starCountRef;
  // starCountRef.onValue.listen((DatabaseEvent event) {
  //   final data = event.snapshot.value;
  //   print(data);
  // });
}
