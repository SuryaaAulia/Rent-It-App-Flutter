import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/facility_page.dart';
import 'package:rent_it_flutter/page/payment_page.dart';
import 'package:rent_it_flutter/page/home_page.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SafeArea(child: PaymentPage()),
    ),
  ));
}
