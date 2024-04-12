import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/home_page.dart'; // Import halaman home
void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that plugin services are initialized
  requestPermissions().then((_) {
    runApp(const MyApp());
  });
}

Future<void> requestPermissions() async {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(), // Set widget HomePage sebagai home
    );
  }
}
