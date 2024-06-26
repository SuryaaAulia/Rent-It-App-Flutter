import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rent_it_flutter/pages/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RAppBar extends StatefulWidget {
  const RAppBar({Key? key}) : super(key: key);

  @override
  _RAppBarState createState() => _RAppBarState();
}

class _RAppBarState extends State<RAppBar> {
  String userName = '';
  String waktu = '';

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.get(
        Uri.parse('https://rent-it.site/api/auth/getData'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        if (mounted) {
          setState(() {
            userName = userData['data']['user']['name'];
            waktu = userData['data']['waktu'];
          });
        }
      } else {
        print('Failed to fetch user info: ${response.statusCode}');
      }
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    // Navigate to login page after logout
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 35, 5, 20),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat ' + waktu + ', ',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(236, 232, 232, 1),
              ),
            ),
            Text(
              userName,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 28,
                color: Color.fromRGBO(236, 232, 232, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assets/images/RedAvatar.jpeg'),
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
