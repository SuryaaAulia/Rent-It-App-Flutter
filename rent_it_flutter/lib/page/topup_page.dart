import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedIndex = -1; // Menyimpan indeks tombol yang dipilih

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'TopUp',
          style: TextStyle(
              color: Color.fromRGBO(217, 217, 217, 1),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
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
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Saldo Anda',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(84, 78, 78, 1)),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Color.fromRGBO(159, 21, 33, 1),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      const Text(
                        'Rp50.000',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(84, 78, 78, 1)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70.0),
            const Text(
              'Pilihan Saldo TopUp',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(84, 78, 78, 1)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: _buildTopUpButton(text: 'Rp10.000', index: 0),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: _buildTopUpButton(text: 'Rp20.000', index: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: _buildTopUpButton(text: 'Rp25.000', index: 2),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: _buildTopUpButton(text: 'Rp50.000', index: 3),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: _buildTopUpButton(text: 'Rp100.000', index: 4),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: _buildTopUpButton(text: 'Rp200.000', index: 5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size(100.0, 0.0)), // Atur lebar minimum tombol
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(255, 255, 255, 1),
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 12.0), // Atur padding tombol secara vertikal
                  child: Text(
                    'TopUp',
                    style: TextStyle(
                      fontSize: 16.0, // Atur ukuran teks
                      fontWeight: FontWeight.w600, // Atur tebal teks
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildTopUpButton({required String text, required int index}) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: selectedIndex == index
                ? const Color.fromRGBO(226, 42, 50, 1)
                : Colors.red,
            width: 3.0,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          selectedIndex == index
              ? const Color.fromRGBO(226, 42, 50, 1)
              : Colors.transparent,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selectedIndex == index ? Colors.white : Colors.red,
        ),
      ),
    );
  }
}
