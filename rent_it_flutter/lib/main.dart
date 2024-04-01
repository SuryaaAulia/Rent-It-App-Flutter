import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/topup_page.dart'; // Mengimpor halaman topup_page.dart

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SafeArea(
          child: TopupPage()), // Mengganti HomePage() dengan TopupPage()
    ),
  ));
}
