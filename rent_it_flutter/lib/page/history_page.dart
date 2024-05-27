import 'package:flutter/material.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Stack(
              children: [
                ROverlayImage(
                  screenWidth: screenWidth * 0.9,
                  screenHeight: screenHeight * 0.25,
                  image: const AssetImage('assets/images/ged_damar.jpg'),
                ),
                RTopTextOverlay(
                  borderStyle: BoxShape.rectangle,
                  screenWidth: screenWidth,
                  color: rGray,
                  tanggal: 'Hari Ini',
                  waktu: '11.00 - 12.00',
                ),
                const RBottomTextOverlay(
                  sizeNamaGedung: 20,
                  color: rGray,
                  namaGedung: 'Gedung Damar',
                  descGedung:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Stack(
              children: [
                ROverlayImage(
                  screenWidth: screenWidth * 0.9,
                  screenHeight: screenHeight * 0.25,
                  image: const AssetImage('assets/images/lap_tennis.jpg'),
                ),
                RTopTextOverlay(
                  borderStyle: BoxShape.rectangle,
                  screenWidth: screenWidth,
                  color: rGray,
                  tanggal: 'Hari Ini',
                  waktu: '16.00 - 17.00',
                ),
                const RBottomTextOverlay(
                  sizeNamaGedung: 20,
                  color: rGray,
                  namaGedung: 'Lapangan Tenis',
                  descGedung:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
