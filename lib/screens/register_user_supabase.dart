import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/auth_provider.dart';

class SignInUserSupa extends StatefulWidget {
  const SignInUserSupa({super.key});

  @override
  State<SignInUserSupa> createState() => _SignInUserSupaState();
}

class _SignInUserSupaState extends State<SignInUserSupa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            signInUser("vano@gmail.com", "vano_aja");
          }, child: Text("Sign In")),
        ],
      )
      ,
    );
  }
}