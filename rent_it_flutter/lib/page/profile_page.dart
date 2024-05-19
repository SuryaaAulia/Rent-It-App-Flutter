import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isPasswordVisible = false;
  String _password = 'password123';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile Page',
            style: TextStyle(
                color: Color.fromRGBO(217, 217, 217, 1),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(159, 21, 33, 1),
                  Color.fromRGBO(226, 42, 50, 1)
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              SizedBox(height: 16),
              Text(
                'Nama Pengguna',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'email@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _isPasswordVisible ? _password : '********',
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 32),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
                child: Text('Edit'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey[700],
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: Size(double.infinity,
                      50), // Set the button width to full width and height to 50
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(
                    color: Colors.grey[700]!,
                    width: 2.0,
                  ),
                ),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  // Logika untuk tombol logout
                },
                child: Text('Logout'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: Size(double.infinity,
                      50), // Set the button width to full width and height to 50
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
