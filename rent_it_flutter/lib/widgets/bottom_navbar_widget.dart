import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/rent_page.dart';

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
      onTap: (int index) {
        // Handle navigation when items are tapped
        switch (index) {
          case 0:
            // Navigate to Notification page
            break;
          case 1:
            // Navigate to Rent page when "BOOK NOW!" is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RentPage()),
            );
            break;
          case 2:
            // Navigate to History page            
            break;
          default:
            break;
        }
      },
    );
  }
}
