import 'package:flutter/material.dart';
import 'package:rent_it_flutter/widgets/wallet_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 25),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Saldo Anda',
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(84, 78, 78, 1)),
              ),
              const RWallet(),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Fasilitas Yang Di Pinjam',
                        style: TextStyle(
                            fontSize: 20, color: Color.fromRGBO(84, 78, 78, 1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Stack(
                          children: [
                            Image.asset('assets/gedung_damar.png'),
                            const Positioned(
                              top: 10,
                              right: 10,
                              child: Text('20/6/24',
                                  style: TextStyle(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      fontSize: 20)),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Gedung Damar',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
                                            fontSize: 20),
                                      ),
                                      Container(
                                        child: const Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  217, 217, 217, 1),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Harga : ',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(84, 78, 78, 1)),
                ),
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
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Color.fromRGBO(236, 232, 232, 1),
                            title: const Text('Konfirmasi Pembayaran'),
                            content: const Text(
                                'Apakah Anda yakin ingin melakukan pembayaran?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Tambahkan logika jika pembayaran berhasil
                                  Navigator.of(context).pop(); // Tutup dialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            Color.fromRGBO(236, 232, 232, 1),
                                        title: const Text(
                                            'Konfirmasi Pembayaran Berhasil'),
                                        content:
                                            const Text('Pembayaran berhasil!'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Tutup dialog konfirmasi berhasil
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
                                      color: Color.fromRGBO(226, 42, 50, 1)),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Tambahkan logika jika pembayaran dibatalkan
                                  Navigator.of(context).pop(); // Tutup dialog
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
                    child: const Text('Bayar'),
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
