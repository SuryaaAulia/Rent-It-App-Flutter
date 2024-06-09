import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rent_it_flutter/models/history.dart';
import 'package:rent_it_flutter/pages/facility_page.dart';
import 'package:rent_it_flutter/services/facility_service.dart';
import 'package:rent_it_flutter/services/history_service.dart';
import 'package:rent_it_flutter/widgets/bottom_navbar_widget.dart';
import 'package:rent_it_flutter/widgets/image_overlay_widget.dart';
import 'package:rent_it_flutter/widgets/shimmer_widget.dart';
import 'package:rent_it_flutter/widgets/text_overlay.dart';
import 'package:rent_it_flutter/widgets/top_widget.dart';
import 'package:rent_it_flutter/widgets/appbar_widget.dart';
import 'package:rent_it_flutter/widgets/wallet_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/models/facility.dart';
import '/utils/path_parse.dart';

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
  late Future<List<Facility>> futureFacilities;
  late Future<List<History>> futureHistory;

  @override
  void initState() {
    super.initState();
    futureFacilities = _loadFacilitiesWithDelay();
    futureHistory = _loadHistoryWithDelay();
  }

  Future<List<Facility>> _loadFacilitiesWithDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    return FacilityService().fetchFacilities();
  }

  Future<List<History>> _loadHistoryWithDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    return HistoryService().fetchHistories();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    const rGray = Color.fromRGBO(236, 232, 232, 1);

    return SafeArea(
      child: Scaffold(
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
              FutureBuilder<List<Facility>>(
                future: futureFacilities,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RShimmerWidget.rectangle(
                              width: screenWidth * 0.9,
                              height: screenHeight * 0.25,
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                            'Failed to load facilities: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No facilities available'));
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          ROverlayImage(
                            screenWidth: screenWidth * 0.9,
                            screenHeight: screenHeight * 0.25,
                            image:
                                const AssetImage('assets/images/ged_damar.jpg'),
                          ),
                          RTopTextOverlay(
                            borderStyle: BoxShape.circle,
                            icon: Icons.more_horiz_rounded,
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: rGray,
                                width: 2),
                            screenWidth: screenWidth,
                            color: rGray,
                            tanggal: 'Hari Ini',
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
                  );
                },
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
              FutureBuilder<List<Facility>>(
                future: futureFacilities,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: RShimmerWidget.rectangle(
                                width: screenWidth * 0.9,
                                height: 200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                            'Failed to load facilities: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No facilities available'));
                  }

                  final facilities = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CarouselSlider.builder(
                              carouselController: controller,
                              itemCount: 4,
                              itemBuilder: (context, index, realIndex) {
                                final facility = facilities[index];
                                return buildImage(facility.image, facility.name,
                                    screenWidth * 0.9, screenHeight * 0.4);
                              },
                              options: CarouselOptions(
                                autoPlay: true,
                                height: 200,
                                enableInfiniteScroll: false,
                                autoPlayAnimationDuration:
                                    const Duration(seconds: 2),
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) =>
                                    setState(() => activeIndex = index),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          buildIndicator(4),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const RBottomNavbar(),
      ),
    );
  }

  Widget buildIndicator(int count) => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Color.fromRGBO(84, 78, 78, 1)),
        activeIndex: activeIndex,
        count: count,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String imageUrl, String name, double width, double height) =>
    SizedBox(
        width: width,
        child: Stack(
          children: [
            ROverlayImage(
              image: AssetImage(getLocalImagePath(imageUrl.split(', ')[0])),
              screenHeight: height,
              screenWidth: width,
            ),
            RTopTextOverlay(
              borderStyle: BoxShape.circle,
              color: const Color.fromRGBO(236, 232, 232, 1),
              screenWidth: width,
              icon: Icons.info_outline,
            ),
            RBottomTextOverlay(
              color: const Color.fromRGBO(236, 232, 232, 1),
              namaGedung: name,
              sizeNamaGedung: 14,
            )
          ],
        ));
