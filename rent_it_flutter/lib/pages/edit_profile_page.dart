// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Set default values or fetch user details
//     _nameController.text = "Nama Pengguna";
//     _emailController.text = "email@example.com";
//   }

//   Future<void> _updateProfile() async {
//     final String apiUrl = 'https://rent-it.site/api/auth/update-profile';
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       body: {
//         'name': _nameController.text,
//         'email': _emailController.text,
//       },
//     );

//     if (response.statusCode == 200) {
//       // Handle success
//       print('Profile updated successfully');
//     } else {
//       // Handle error
//       print('Failed to update profile');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Edit Profile',
//             style: TextStyle(
//               color: Color.fromRGBO(217, 217, 217, 1),
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           centerTitle: true,
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: <Color>[
//                   Color.fromRGBO(159, 21, 33, 1),
//                   Color.fromRGBO(226, 42, 50, 1)
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 32),
//               OutlinedButton(
//                 onPressed: _updateProfile,
//                 child: Text('Save'),
//                 style: OutlinedButton.styleFrom(
//                   foregroundColor: Color.fromRGBO(226, 42, 50, 1),
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                   minimumSize: Size(double.infinity, 50),
//                   textStyle: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   side: BorderSide(
//                     color: Color.fromRGBO(226, 42, 50, 1),
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
