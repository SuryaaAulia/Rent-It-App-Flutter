import 'package:flutter/material.dart';
import 'package:rent_it_flutter/widgets/bottom_navbar_widget.dart';
import 'package:rent_it_flutter/widgets/top_widget.dart';
import 'package:rent_it_flutter/widgets/appbar_widget.dart';
import 'package:rent_it_flutter/widgets/wallet_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 232, 232, 1),
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
                Container(
                  width: screenWidth * 0.9,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Fasilitas Yang Kami Sediakan',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('More',
                      style: TextStyle(color: Color.fromRGBO(159, 21, 33, 1)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child:
                        Image(image: AssetImage('assets/images/ged_damar.jpg')),
                  ),
                  Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const RBottomNavbar(),
    );
  }
}
