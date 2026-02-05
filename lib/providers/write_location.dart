import 'package:firebase_database/firebase_database.dart';
Future writeLocation(user, {latitude, longitude}) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref(user);
  await ref.update({
  "latitude": latitude,
  "longitude": longitude,
});
}