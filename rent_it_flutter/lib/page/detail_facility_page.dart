import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/facility_page.dart'; // Import halaman facility

class DetailFacilityPage extends StatelessWidget {
  final FacilityItems item;
  final String title;

  const DetailFacilityPage(
      {super.key, required this.title, required this.item});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: const TextStyle(color: Color.fromRGBO(217, 217, 217, 1))),
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Image(
                  image: item.image,
                ),
              ),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('Deskripsi :', style: TextStyle(fontSize: 15)),
                      Text(item.description,
                          style: const TextStyle(fontSize: 15)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text('Price : ',
                              style: TextStyle(fontSize: 15)),
                          Text(
                            item.price,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(159, 21, 32, 1)),
                          )
                        ],
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ), // Bancground tombol
                  overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(226, 42, 50, 1),
                  ), // Warna saat ditekan
                  foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(226, 42, 50, 1),
                  ), // Warna merah teks
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(
                      color: Color.fromRGBO(
                          226, 42, 50, 1), // Warna pada pinggir button
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Back',
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
