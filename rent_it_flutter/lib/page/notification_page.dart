import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  static const _pageSize = 5;

  final PagingController<int, NotificationItem> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await fetchNotifications(pageKey, _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  Future<List<NotificationItem>> fetchNotifications(int offset, int limit) async {
    // Simulate fetching data from a network or database
    await Future.delayed(Duration(seconds: 2));

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

    // Return a subset of notifications based on the offset and limit
    final start = offset;
    final end = start + limit;
    return notifications.sublist(start, end > notifications.length ? notifications.length : end);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(217, 217, 217, 1)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Notification',
          style: TextStyle(color: Color.fromRGBO(217, 217, 217, 1)),
        ),
        centerTitle: true,
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
      body: PagedListView<int, NotificationItem>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<NotificationItem>(
          itemBuilder: (context, item, index) => item,
          noMoreItemsIndicatorBuilder: (context) => Column(
            children: [
              Divider(),  // Custom red divider
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Kamu sudah membaca semua notifikasi",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
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
