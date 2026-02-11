import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in_web/google_sign_in_web.dart' as web;

class SignInTest extends StatefulWidget {
  const SignInTest({super.key});

  @override
  State<SignInTest> createState() => _SignInTestState();
}

class _SignInTestState extends State<SignInTest> {
  @override
  void initState() {
    super.initState();

    // #docregion Setup
    final GoogleSignIn signIn = GoogleSignIn.instance;
    unawaited(
      signIn.initialize(
        serverClientId:
            "1046944949705-og0jttfujlh646rdfg3vek0nk8b7r2ag.apps.googleusercontent.com",
      ),
    );
    // #enddocregion Setup
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (GoogleSignIn.instance.supportsAuthenticate())
            ? ElevatedButton(
                onPressed: () async {
                  try {
                    await GoogleSignIn.instance.authenticate();
                  } catch (e) {
                    print('Error during Google Sign-In: $e');
                  }
                },
                child: const Text('SIGN IN'),
              )
            : const Text('Google Sign-In not supported'),
      ),
    );
  }
}
