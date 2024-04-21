import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/facility_page.dart';
import 'package:rent_it_flutter/widgets/bottom_navbar_widget.dart';
import 'package:rent_it_flutter/widgets/image_overlay_widget.dart';
import 'package:rent_it_flutter/widgets/text_overlay.dart';
import 'package:rent_it_flutter/widgets/top_widget.dart';
import 'package:rent_it_flutter/widgets/appbar_widget.dart';
import 'package:rent_it_flutter/widgets/wallet_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double screenWidth;
  late double screenHeight;
  late Color rGray;

  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/images/ged_sc.jpg',
    'assets/images/ged_damar.jpg',
    'assets/images/GSG.jpg',
    'assets/images/avatar.jpg',
    'assets/images/lap_tennis.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    const rGray = Color.fromRGBO(236, 232, 232, 1);

    return Scaffold(
      backgroundColor: rGray,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const RShapeTopWidget(
              child: Column(
                children: <Widget>[RAppBar(), RWallet()],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: <Widget>[
                  Text(
                    'Fasilitas Yang Kamu Pinjam',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ROverlayImage(
                      screenWidth: screenWidth * 0.9,
                      screenHeight: screenHeight * 0.25,
                      image: const AssetImage('assets/images/ged_damar.jpg'),
                    ),
                    RTopTextOverlay(
                      borderStyle: BoxShape.circle,
                      icon: Icons.more_horiz_rounded,
                      border: Border.all(
                          style: BorderStyle.solid, color: rGray, width: 2),
                      screenWidth: screenWidth,
                      color: rGray,
                      tanggal: 'Hari Ini',
                      waktu: '13.00 - 14.00',
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Fasilitas Yang Kami Sediakan',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FacilityPage()),
                        );
                      },
                      child: const Text('More',
                          style: TextStyle(
                              color: Color.fromRGBO(159, 21, 33, 1)))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CarouselSlider.builder(
                        carouselController: controller,
                        itemCount: urlImages.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = urlImages[index];
                          return buildImage(urlImage, index, screenWidth * 0.9,
                              screenHeight * 0.4);
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 200,
                          enableInfiniteScroll: false,
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    buildIndicator(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const RBottomNavbar(),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Color.fromRGBO(84, 78, 78, 1)),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String image, int index, double width, double height) =>
    SizedBox(
        width: width,
        child: Stack(
          children: [
            ROverlayImage(
              image: AssetImage(image),
              screenHeight: height,
              screenWidth: width,
            ),
            RTopTextOverlay(
              borderStyle: BoxShape.circle,
              color: const Color.fromRGBO(236, 232, 232, 1),
              screenWidth: width,
              icon: Icons.info_outline,
            ),
            const RBottomTextOverlay(
              color: Color.fromRGBO(236, 232, 232, 1),
              namaGedung: 'Gedung Serbaguna',
              sizeNamaGedung: 14,
            )
          ],
        ));
