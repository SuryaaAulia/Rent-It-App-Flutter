import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/home_page.dart';
import 'package:rent_it_flutter/page/payment_page.dart';
// import 'package:rent_it_flutter/page/home_page.dart';
// import 'package:rent_it_flutter/page/login_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Color.fromRGBO(217, 217, 217, 1)),
      ),
    ),
    home: const Scaffold(
      body: SafeArea(child: HomePage()),
    ),
  ));
}
