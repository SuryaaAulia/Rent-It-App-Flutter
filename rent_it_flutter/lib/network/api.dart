import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'https://rent-it.site/api/auth';
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // token = jsonDecode(localStorage.getString('token'))['token'];
  }
}
