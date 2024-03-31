import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/home_page.dart';
import 'package:rent_it_flutter/widgets/appbar_widget.dart';
import 'package:rent_it_flutter/widgets/top_widget.dart';
import 'package:rent_it_flutter/widgets/wallet_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      backgroundColor: const Color.fromRGBO(236, 232, 232, 1),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
              child: TextField(
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
                onPressed: () {
                  // Navigasi ke halaman beranda jika login berhasil
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Login'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
