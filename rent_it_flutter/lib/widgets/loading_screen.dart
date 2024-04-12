import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rent_it_flutter/widgets/appbar_widget.dart';
import 'package:rent_it_flutter/page/home_page.dart';
import 'package:rent_it_flutter/widgets/top_widget.dart';

class LoadingScreen extends StatefulWidget {
  final String nama;
  final String nim;
  final String email;
  final String phoneNumber;
  final String tempatDipilih;
  final String hargaTempat;

  const LoadingScreen({
    required this.nama,
    required this.nim,
    required this.email,
    required this.phoneNumber,
    required this.tempatDipilih,
    required this.hargaTempat,
    Key? key,
  }) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Set _isLoading to true to trigger animation
    _isLoading = true;
    // Simulate processing for 2 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 112, 38, 38),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const RAppBar(),
          const SizedBox(height: 50.0),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            height: _isLoading ? 0 : 0,
            child: CircularProgressIndicator(),
          ),
          const SizedBox(height: 20.0),
          AnimatedOpacity(
            opacity: _isLoading ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: Text(
              'Sedang memproses permintaan...',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          AnimatedOpacity(
            opacity: _isLoading ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: Column(
              children: [
                Text(
                  'Nama: ${widget.nama}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'NIM: ${widget.nim}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Email: ${widget.email}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Nomor Telepon: ${widget.phoneNumber}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Tempat yang dipilih: ${widget.tempatDipilih}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Harga Tempat: Rp ${widget.hargaTempat}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
