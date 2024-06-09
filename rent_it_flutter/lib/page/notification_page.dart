import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rent_it_flutter/models/pemesanan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late Future<NotificationData> futureNotifications;

  @override
  void initState() {
    super.initState();
    futureNotifications = fetchNotifications();
  }

  Future<NotificationData> fetchNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('https://rent-it.site/api/auth/getstatus'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return NotificationData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification Page',
            style: TextStyle(color: Color.fromRGBO(217, 217, 217, 1)),
          ),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(159, 21, 33, 1),
                  Color.fromRGBO(226, 42, 50, 1),
                ],
              ),
            ),
          ),
        ),
        body: FutureBuilder<NotificationData>(
          future: futureNotifications,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.daftar.isEmpty) {
              return const Center(child: Text('No notifications found'));
            } else {
              var notifications = snapshot.data!.daftar.map((pemesanan) {
                IconData icon;
                String title;

                switch (pemesanan.status) {
                  case 'Approved':
                    icon = Icons.monetization_on_outlined;
                    title =
                        "Peminjaman kamu untuk ${pemesanan.facilityName} sudah disetujui, harap lakukan pembayaran segera!";
                    break;
                  case 'Rejected':
                    icon = Icons.warning;
                    title =
                        "Peminjaman kamu untuk ${pemesanan.facilityName} ditolak.";
                    break;
                  case 'Completed':
                    icon = Icons.done_all;
                    title =
                        "Peminjaman kamu untuk ${pemesanan.facilityName} sudah selesai.";
                    break;
                  case 'Paid':
                    icon = Icons.account_balance_wallet;
                    title =
                        "Pembayaran kamu untuk ${pemesanan.facilityName} sudah kami terima.";
                    break;
                  default:
                    icon = Icons.calendar_today_outlined;
                    title =
                        "Peminjaman kamu untuk ${pemesanan.facilityName} menunggu persetujuan.";
                    break;
                }

                return NotificationItem(icon: icon, title: title);
              }).toList();

              return ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return notifications[index];
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const NotificationItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.red,
            size: 48.0,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
