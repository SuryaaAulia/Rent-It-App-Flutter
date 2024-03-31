import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
            color: Color.fromRGBO(217, 217, 217, 1)), // Set icon color to white
      ),
    ),
    home: const Scaffold(
      body: SafeArea(child: HomePage()),
    ),
  ));
}
