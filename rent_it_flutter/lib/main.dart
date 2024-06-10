// import 'package:flutter/material.dart';
// import 'package:rent_it_flutter/page/home_page.dart';
// import 'package:rent_it_flutter/page/landing_page.dart';
// import 'package:rent_it_flutter/page/login_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   Future<bool> _checkIfLoggedIn() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//     return token != null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _checkIfLoggedIn(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else {
//           bool isLoggedIn = snapshot.data ?? false;
//           return MaterialApp(
//             routes: {'/login': ((context) => LoginPage())},
//             title: 'Your App',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             home: isLoggedIn ? HomePage() : LandingPage(),
//           );
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:rent_it_flutter/pages/login_page.dart';
import 'package:rent_it_flutter/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/login': ((context) => LoginPage())},
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
