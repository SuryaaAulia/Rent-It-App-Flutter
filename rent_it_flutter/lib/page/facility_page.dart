import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/detail_facility_page.dart'; // Import halaman detail

class FacilityPage extends StatelessWidget {
  const FacilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Facility Page',
          style: TextStyle(color: Color.fromRGBO(217, 217, 217, 1)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromRGBO(159, 21, 33, 1),
                Color.fromRGBO(226, 42, 50, 1)
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(236, 232, 232, 1),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FacilityItems(
                  image: AssetImage('assets/images/ged_damar.jpg'),
                  title: 'Gedung Damar',
                  price: 'Rp. 100.000',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                ),
                FacilityItems(
                  image: AssetImage('assets/images/GSG.jpg'),
                  title: 'GSG',
                  price: 'Rp. 500.000',
                  description: 'Description 2',
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class FacilityItems extends StatelessWidget {
  final AssetImage image; // Menggunakan AssetImage sebagai tipe data
  final String title;
  final String price;
  final String description;

  const FacilityItems({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Menggunakan GestureDetector untuk menangani gesture onTap
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailFacilityPage(
                    title: title,
                    item: this,
                  )), // Mengirim judul item yang dipilih ke halaman detail
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: image,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
