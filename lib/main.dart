import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:flutter_application_1/screens/admin_screen.dart';
import 'package:flutter_application_1/screens/driver_screen.dart';
import 'package:flutter_application_1/screens/user_screen.dart';
import 'package:flutter_application_1/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://uuyuwqngeviyzgdrfjqc.supabase.co',
    anonKey: 'sb_publishable_yYtSrHUr2-tfKYS4SpeGVQ_XMSwrhTQ',
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}