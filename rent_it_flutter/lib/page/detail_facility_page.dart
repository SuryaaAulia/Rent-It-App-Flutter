import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rent_it_flutter/page/facility_page.dart'; // Import halaman facility

class DetailFacilityPage extends StatelessWidget {
  final FacilityItems item;
  final String title;

  const DetailFacilityPage({Key? key, required this.title, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: TextStyle(color: Color.fromRGBO(217, 217, 217, 1))),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                const Color.fromRGBO(159, 21, 33, 1),
                const Color.fromRGBO(226, 42, 50, 1)
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
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Deskripsi :', style: TextStyle(fontSize: 15)),
                      Text(item.description, style: TextStyle(fontSize: 15)),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('Price : ', style: TextStyle(fontSize: 15)),
                          Text(
                            item.price,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(159, 21, 32, 1)),
                          )
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ), // Bancground tombol
                  overlayColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(226, 42, 50, 1),
                  ), // Warna saat ditekan
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(226, 42, 50, 1),
                  ), // Warna merah teks
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      color: Color.fromRGBO(
                          226, 42, 50, 1), // Warna pada pinggir button
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
