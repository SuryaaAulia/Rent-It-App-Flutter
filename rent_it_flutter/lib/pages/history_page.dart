import 'package:flutter/material.dart';
import 'package:rent_it_flutter/models/history.dart';
import 'package:rent_it_flutter/services/history_service.dart';
import 'package:rent_it_flutter/utils/path_parse.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Future<List<History>> _historiesFuture;

  @override
  void initState() {
    super.initState();
    _historiesFuture = fetchHistories();
  }

  Future<List<History>> fetchHistories() async {
    final historyService = HistoryService();
    List<History> histories = await historyService.fetchHistories();
    return histories.where((history) => history.status != 'Approved').toList();
  }

  Future<void> _refreshHistories() async {
    setState(() {
      _historiesFuture = fetchHistories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromRGBO(217, 217, 217, 1)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'History',
            style: TextStyle(color: Color.fromRGBO(217, 217, 217, 1)),
          ),
          centerTitle: true,
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
        body: FutureBuilder<List<History>>(
          future: _historiesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No orders found.'));
            } else {
              final histories = snapshot.data!;
              return RefreshIndicator(
                onRefresh: _refreshHistories,
                color: Colors.red,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: histories.length,
                  itemBuilder: (context, index) {
                    final history = histories[index];
                    return HistoryItem(history: history);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final History history;

  const HistoryItem({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              gradient: const LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(159, 21, 33, 1),
                  Color.fromRGBO(226, 42, 50, 1),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.other_houses_outlined, color: Colors.white),
                  const SizedBox(width: 8.0),
                  Text(
                    history.categoryName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    history.tanggalPemesanan,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(13.0, 8.0, 13.0, 8.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(
                      getLocalImagePath(history.image.split(', ')[0])),
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history.namaGedung,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Total Bayar'),
                              Text(
                                "Rp ${history.harga.toString()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            color: history.statusBackgroundColor,
                            child: Text(
                              history.status,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: history.statusTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
