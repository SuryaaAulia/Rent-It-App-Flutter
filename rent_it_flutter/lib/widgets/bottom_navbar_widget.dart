import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/history_page.dart'; // Import your HistoryPage

class RBottomNavbar extends StatelessWidget {
  const RBottomNavbar({Key? key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: const Color.fromRGBO(159, 21, 33, 1),
      selectedItemColor: const Color.fromRGBO(159, 21, 33, 1),
      items: const [
        BottomNavigationBarItem(
          label: "Notification",
          icon: Icon(Icons.notifications_active_outlined),
        ),
        BottomNavigationBarItem(
          label: "BOOK NOW!",
          icon: Icon(Icons.calendar_today_outlined),
        ),
        BottomNavigationBarItem(
          label: "History",
          icon: Icon(Icons.history),
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            break;
          case 1:
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HistoryPage()),
            );
            break;
        }
      },
    );
  }
}
