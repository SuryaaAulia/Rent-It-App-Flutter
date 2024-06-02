import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/home_page.dart';
import 'package:rent_it_flutter/widgets/custom_shapes_login.dart'; // Import custom clipper

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(236, 232, 232, 1),
      body: Stack(
        children: [
          ClipPath(
            clipper: RClipPath2(),
            child: Container(
              color: const Color.fromARGB(
                  255, 226, 42, 50), // Warna dari RClipPath2
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                  child: Image(
                    image: AssetImage('assets/images/Logo_Rentit.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
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
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
