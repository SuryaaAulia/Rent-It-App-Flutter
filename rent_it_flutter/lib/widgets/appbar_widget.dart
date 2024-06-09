import 'package:flutter/material.dart';
import 'package:rent_it_flutter/pages/profile_page.dart';
import 'package:rent_it_flutter/widgets/shimmer_widget.dart';

class RAppBar extends StatelessWidget {
  const RAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 35, 5, 20),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Siang',
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(236, 232, 232, 1)),
            ),
            FutureBuilder<String>(
              future:
                  Future.delayed(const Duration(seconds: 2), () => 'Stevent'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const RShimmerWidget.rectangle(width: 200, height: 30);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text(snapshot.data!,
                      style: const TextStyle(
                          fontSize: 32,
                          color: Color.fromRGBO(236, 232, 232, 1),
                          fontWeight: FontWeight.bold));
                }
              },
            )
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
            child: FutureBuilder<String>(
              future: Future.delayed(
                  const Duration(seconds: 2), () => 'assets/images/avatar.jpg'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey[400],
                  );
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error);
                } else {
                  return CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(snapshot.data!),
                    backgroundColor: Colors.grey[400],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
