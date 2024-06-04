import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rent_it_flutter/page/home_page.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import custom clipper

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _initPage();
  }

  // Future<void> _initPage() async {
  //   await _getDeviceName();
  // }

  // Future<void> _getDeviceName() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   if (Theme.of(context).platform == TargetPlatform.android) {
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     setState(() {
  //       deviceName = androidInfo
  //           .device; // Menggunakan androidInfo.device untuk mendapatkan nama perangkat
  //     });
  //   } else if (Theme.of(context).platform == TargetPlatform.iOS) {
  //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //     setState(() {
  //       deviceName = iosInfo.name;
  //     });
  //   }
  // }

  Future<void> _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    final response = await http.post(
      Uri.parse('https://rent-it.site/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'device_name': 'Android Test'
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String token = data['data']['token'];
      // print(token);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      // Jika login berhasil, navigasi ke halaman beranda
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Error"),
            content: Text("Invalid email or password"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(236, 232, 232, 1),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.black, width: 5.0),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //     child: Image(
                  //       image: AssetImage('assets/images/Logo_Rentit.png'),
                  //       width: 50,
                  //       height: 50,
                  //     ),
                  //   ),
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                    child: Image(
                      image: AssetImage('assets/images/Logo_Rentit.png'),
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
