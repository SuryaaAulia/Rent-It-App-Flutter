import 'package:flutter/material.dart';
// import 'package:rent_it_flutter/page/home_page.dart';
import 'package:rent_it_flutter/page/notification_page.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SafeArea(child: NotificationPage()),
    ),
  ));
}
