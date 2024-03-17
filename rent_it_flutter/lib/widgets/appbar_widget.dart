import 'package:flutter/material.dart';

class RAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RAppBar({super.key});
  final double height = 200;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Siang',
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(236, 232, 232, 1)),
            ),
            Text('Stevent',
                style: TextStyle(
                    fontSize: 32,
                    color: Color.fromRGBO(236, 232, 232, 1),
                    fontWeight: FontWeight.bold))
          ],
        ),
        actions: const [
          CircleAvatar(
            radius: 45,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
