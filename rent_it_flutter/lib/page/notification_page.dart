import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NotificationItem> notifications = [
      NotificationItem(
          icon: Icons.check_circle,
          title: "Peminjaman kamu untuk Gedung Damar\nsudah di setujui, harap lakukan pembayaran segera!"),
      NotificationItem(
          icon: Icons.calendar_today_outlined,
          title: "Peminjaman kamu untuk Gedung Damar\nmenunggu persetujuan."),
      NotificationItem(
          icon: Icons.done_all,
          title: "Peminjaman kamu untuk Gedung Serba\nGuna sudah selesai."),
      NotificationItem(
          icon: Icons.account_balance_wallet,
          title: "Pembayaran kamu untuk Gedung Serba\nGuna sudah kami terima."),
      NotificationItem(
          icon: Icons.check_circle,
          title: "Peminjaman kamu untuk Gedung Serba\nGuna sudah di setujui, harap lakukan pembayaran segera!"),
      NotificationItem(
          icon: Icons.calendar_today_outlined,
          title: "Peminjaman kamu untuk Gedung Serba\nGuna menunggu persetujuan."),
      NotificationItem(
          icon: Icons.warning,
          title: "Laporan kamu untuk Gedung Damar\nsudah kami proses."),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification Page',
          style: TextStyle(color: Color.fromRGBO(217, 217, 217, 1)),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                const Color.fromRGBO(159, 21, 33, 1),
                const Color.fromRGBO(226, 42, 50, 1),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return notifications[index];
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const NotificationItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add the Icon widget here
          Icon(
            icon,
            color: Colors.red,
            size: 48.0,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
