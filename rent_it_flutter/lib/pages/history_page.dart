import 'package:flutter/material.dart';
import 'package:rent_it_flutter/models/history.dart';
import 'package:rent_it_flutter/services/history_service.dart';
import 'package:rent_it_flutter/utils/path_parse.dart';
import 'package:rent_it_flutter/widgets/image_overlay_widget.dart';
import 'package:rent_it_flutter/widgets/text_overlay.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const rGray = Color.fromRGBO(236, 232, 232, 1);

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
        body: Center(
          child: FutureBuilder<List<History>>(
            future: HistoryService().fetchHistory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text('No history found');
              }

              final histories = snapshot.data!;
              return ListView.builder(
                itemCount: histories.length,
                itemBuilder: (context, index) {
                  final history = histories[index];
                  return Column(
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      Stack(
                        children: [
                          ROverlayImage(
                            screenWidth: screenWidth * 0.9,
                            screenHeight: screenHeight * 0.25,
                            image: AssetImage(getLocalImagePath(
                                history.image..split(', ')[0])),
                          ),
                          RTopTextOverlay(
                            borderStyle: BoxShape.rectangle,
                            screenWidth: screenWidth,
                            color: rGray,
                            tanggal: history.tanggalPemesanan,
                          ),
                          RBottomTextOverlay(
                            sizeNamaGedung: 20,
                            color: rGray,
                            namaGedung: history.namaGedung,
                            descGedung: history.desc,
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
