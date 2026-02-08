import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreenSupa extends StatefulWidget {
  const LoginScreenSupa({super.key});

  @override
  State<LoginScreenSupa> createState() => _LoginScreenSupaState();
}

class _LoginScreenSupaState extends State<LoginScreenSupa> {
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await supabase.auth.signInWithPassword(
              email: "kevin@gmail.com",
              password: "kevin_apt",
            );
          },
          child: Text('Press me'),
        ),
      ),
    );
  }
}
