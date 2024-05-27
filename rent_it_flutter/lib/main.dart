import 'package:flutter/material.dart';
import 'package:rent_it_flutter/pages/home_page.dart';
import 'package:rent_it_flutter/pages/landing_page.dart';
import 'package:rent_it_flutter/pages/payment_page.dart';
import 'package:rent_it_flutter/pages/profile_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Color.fromRGBO(217, 217, 217, 1)),
      ),
    ),
    home: const Scaffold(
      body: SafeArea(child: LandingPage()), // Hapus const dari sini
    ),
  ));
}
