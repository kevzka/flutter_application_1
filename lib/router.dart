import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_page_screen.dart';
import 'package:flutter_application_1/screens/admin_screen.dart';
import 'package:flutter_application_1/screens/driver_screen.dart';
import 'package:flutter_application_1/screens/user_screen.dart';
import 'package:flutter_application_1/screens/location_screen.dart';
import 'package:flutter_application_1/screens/google_map_screen.dart';
import 'package:flutter_application_1/screens/real_time_db_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// GoRouter configuration
final router = GoRouter(
  // refreshListenable: GoRouterRefreshStream(
  //   FirebaseAuth.instance.authStateChanges(),
  // ),  
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const locationScreen(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminScreen(),
    ),
    GoRoute(
      path: '/user',
      builder: (context, state) => const UserScreen(),
    ),
    GoRoute(
      path: '/driver',
      builder: (context, state) => const DriverScreen(),
    ),
  ],
  // redirect: (BuildContext context, GoRouterState state) {
  //   final bool isAuthenticated = FirebaseAuth.instance.currentUser != null;
  //   final bool isLoggingIn = state.matchedLocation == '/login';

  //   // 1. Jika belum login dan tidak di halaman login, paksa ke /login
  //   if (!isAuthenticated) {
  //     return isLoggingIn ? null : '/login';
  //   }

  //   if (isLoggingIn) {
  //     return '/admin';
  //   }

  //   // 3. Jika tidak ada masalah, tetap di tempat (return null)
  //   return null;
  // },

);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}