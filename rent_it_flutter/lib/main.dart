import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/landing_page.dart';
// import 'package:rent_it_flutter/page/home_page.dart';
// import 'package:rent_it_flutter/page/login_page.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SafeArea(child: LandingPage()),
    ),
  ));
}
