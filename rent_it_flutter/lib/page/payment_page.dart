import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rent_it_flutter/models/pemesanan.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:rent_it_flutter/widgets/image_overlay_widget.dart';
import 'package:rent_it_flutter/widgets/text_overlay.dart';
import 'package:rent_it_flutter/widgets/wallet_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

  class _PaymentPageState extends State<PaymentPage> {
    List<Pemesanan> pemesanans = [];
    int currentIndex = 0;
    int selectedId = 0;

  @override
  void initState() {
    super.initState();
    _getPemesanans();
  }

  Future<void> _getPemesanans() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.get(
        Uri.parse('https://rent-it.site/api/auth/pemesanans'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // print(response.body);
        Map<String, dynamic> body = jsonDecode(response.body);
        List<dynamic> data = body['data'];
        List<Pemesanan> fetchedPemesanans =
            data.map((dynamic item) => Pemesanan.fromJson(item)).toList();

        setState(() {
          pemesanans = fetchedPemesanans;
          if (pemesanans.isNotEmpty) {
          selectedId = pemesanans[0].id; // Tetapkan selectedId ke id pemesanan pertama
        }
        });
      } else {
        print('Failed to fetch pemesanans: ${response.statusCode}');
      }
    }
  }

  Future<void> _confirmPayment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    print(selectedId);

    if (token != null) {
      final response = await http.post(
        Uri.parse(
            'https://rent-it.site/api/auth/payment'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
        'pemesanan_id': selectedId,
      }),
      );

      if (response.statusCode == 200) {
        print(response.body);
        Navigator.of(context).pop(); // Tutup dialog konfirmasi pembayaran
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromRGBO(236, 232, 232, 1),
              title: const Text('Konfirmasi Pembayaran Berhasil'),
              content: const Text('Pembayaran berhasil!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Color.fromRGBO(226, 42, 50, 1),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        print('Failed to confirm payment: ${response.statusCode}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    const rGray = Color.fromRGBO(236, 232, 232, 1);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Payment',
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Saldo Anda',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(84, 78, 78, 1)),
                ),
                const RWallet(),
                const SizedBox(height: 35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: const Text(
                        'Fasilitas Yang Di Pinjam',
                        style: TextStyle(
                            fontSize: 20, color: Color.fromRGBO(84, 78, 78, 1)),
                      ),
                    ),
                    pemesanans.isEmpty
                        ? const CircularProgressIndicator()
                        : CarouselSlider.builder(
                            itemCount: pemesanans.length,
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              return Stack(
                                children: [
                                  ROverlayImage(
                                    screenWidth: screenWidth * 0.9,
                                    screenHeight: screenHeight * 0.25,
                                    image: NetworkImage(
                                      'https://rent-it.site/storage/' +
                                          pemesanans[index].images.first,
                                    ),
                                  ),
                                  RTopTextOverlay(
                                    borderStyle: BoxShape.circle,
                                    border: Border.all(
                                        style: BorderStyle.solid,
                                        color: rGray,
                                        width: 2),
                                    screenWidth: screenWidth,
                                    color: rGray,
                                    tanggal: pemesanans[index].tanggalPemesanan,
                                    // Jika waktu ada, tambahkan field di model
                                  ),
                                  RBottomTextOverlay(
                                    sizeNamaGedung: 20,
                                    color: rGray,
                                    namaGedung: pemesanans[index].name,
                                    descGedung: pemesanans[index].description,
                                  ),
                                ],
                              );
                            },
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              initialPage: 0,
                              viewportFraction: 0.9,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                  selectedId = pemesanans[index].id;
                                });
                              },
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Harga : ',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(84, 78, 78, 1)),
                    ),
                    Text(
                      pemesanans.isNotEmpty
                          ? 'Rp${pemesanans[currentIndex].price}'
                          : 'Rp0',
                      style: const TextStyle(
                          fontSize: 38,
                          color: Color.fromRGBO(159, 21, 32, 1),
                          fontWeight: FontWeight.w600),
                    ),
                    const Divider(
                      color: Color.fromRGBO(84, 78, 78, 1),
                      endIndent: 45,
                      thickness: 1.2,
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    const Color.fromRGBO(236, 232, 232, 1),
                                title: const Text('Konfirmasi Pembayaran'),
                                content: const Text(
                                    'Apakah Anda yakin ingin melakukan pembayaran?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Panggil fungsi untuk konfirmasi pembayaran
                                      _confirmPayment();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Ya',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(226, 42, 50, 1)),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Tidak',
                                      style: TextStyle(
                                          color: Color.fromRGBO(84, 78, 78, 1)),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(236, 232, 232, 1),
                          ),
                          overlayColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(226, 42, 50, 1),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(226, 42, 50, 1),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color.fromRGBO(226, 42, 50, 1),
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text('Bayar Sekarang'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
