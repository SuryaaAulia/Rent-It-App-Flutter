import 'package:flutter/material.dart';
import 'package:rent_it_flutter/widgets/wallet_widget.dart';

void main() {
  runApp(TopupPage());
}

class TopupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(color: Color.fromRGBO(217, 217, 217, 1)),
        ),
        centerTitle: true,
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo Anda',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.account_balance_wallet,
                          color: Color.fromRGBO(159, 21, 33, 1),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Rp50.000',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Pilihan Saldo TopUp',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTopUpButton(text: 'Rp10.000'),
                        _buildTopUpButton(text: 'Rp20.000'),
                        _buildTopUpButton(text: 'Rp25.000'),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTopUpButton(text: 'Rp50.000'),
                        _buildTopUpButton(text: 'Rp100.000'),
                        _buildTopUpButton(text: 'Rp200.000'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: OutlinedButton(
                onPressed: () {},
                child: Text('TopUp'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(236, 232, 232, 1),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopUpButton({required String text}) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
