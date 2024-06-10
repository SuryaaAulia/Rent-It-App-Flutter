import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataDiriWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController nimController;
  final TextEditingController emailController;
  final TextEditingController noTelController;

  const DataDiriWidget({
    Key? key,
    required this.nameController,
    required this.nimController,
    required this.emailController,
    required this.noTelController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        width: screenWidth * 0.9,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Data Diri Peminjam",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: nimController,
              decoration: const InputDecoration(labelText: 'NIM'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your NIM' : null,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your email' : null,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: noTelController,
              decoration: const InputDecoration(labelText: 'Nomor Telepon'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your phone number' : null,
            ),
          ],
        ),
      ),
    );
  }
}
