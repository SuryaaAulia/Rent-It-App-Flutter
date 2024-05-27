import 'package:flutter/material.dart';
import 'package:rent_it_flutter/widgets/image_overlay_widget.dart';
import 'package:rent_it_flutter/widgets/text_overlay.dart';
import 'package:rent_it_flutter/widgets/wallet_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

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
                    const Text(
                      'Fasilitas Yang Di Pinjam',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(84, 78, 78, 1)),
                    ),
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
                          border: Border.all(
                              style: BorderStyle.solid, color: rGray, width: 2),
                          screenWidth: screenWidth,
                          color: rGray,
                          tanggal: '20/6/24',
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
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Harga : ',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(84, 78, 78, 1)),
                    ),
                    const Text(
                      'Rp50.000',
                      style: TextStyle(
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
                                      // Tambahkan logika jika pembayaran berhasil
                                      Navigator.of(context).pop();
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    236, 232, 232, 1),
                                            title: const Text(
                                                'Konfirmasi Pembayaran Berhasil'),
                                            content: const Text(
                                                'Pembayaran berhasil!'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'OK',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        226, 42, 50, 1),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
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
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Text('Bayar'),
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
