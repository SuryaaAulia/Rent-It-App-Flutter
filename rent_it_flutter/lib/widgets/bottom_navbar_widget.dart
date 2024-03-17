import 'package:flutter/material.dart';

class RBottomNavbar extends StatelessWidget {
  const RBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: const Color.fromRGBO(159, 21, 33, 1),
      selectedItemColor: const Color.fromRGBO(159, 21, 33, 1),
      items: const [
        BottomNavigationBarItem(
            label: "Notification",
            icon: Icon(Icons.notifications_active_outlined)),
        BottomNavigationBarItem(
            label: "BOOK NOW!", icon: Icon(Icons.calendar_today_outlined)),
        BottomNavigationBarItem(label: "History", icon: Icon(Icons.history)),
      ],
    );
  }
}
