import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:rent_it_flutter/page/home_page.dart';
import 'package:rent_it_flutter/widgets/wallet_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  int selectedIndex = -1; // Menyimpan indeks tombol yang dipilih
  int selectedNominal = 0; // Menyimpan nominal yang dipilih
  String balanceFormatted = '';

  // baru
  @override
  void initState() {
    super.initState();
    _getWalletInfo();
  }

  Future<void> _getWalletInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.get(
        Uri.parse('https://rent-it.site/api/auth/getWallet'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        if (mounted) {
          setState(() {
            double balance =
                double.parse(userData['data']['balance'].toString());
            MoneyFormatterOutput formatter = MoneyFormatter(
              amount: balance,
            ).output;
            balanceFormatted = formatter.withoutFractionDigits;
          });
        }
      } else {
        print('Failed to fetch wallet info: ${response.statusCode}');
      }
    }
  }
  // baru

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
                  // const RWallet(),
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
                        Text(
                          // 'Rp50.000',
                          'Rp$balanceFormatted',
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
                            child: _buildTopUpButton(
                                text: 'Rp10.000', index: 0, nominal: 10000),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: _buildTopUpButton(
                                text: 'Rp20.000', index: 1, nominal: 20000),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: _buildTopUpButton(
                                text: 'Rp25.000', index: 2, nominal: 25000),
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
                            child: _buildTopUpButton(
                                text: 'Rp50.000', index: 3, nominal: 50000),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: _buildTopUpButton(
                                text: 'Rp100.000', index: 4, nominal: 100000),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: _buildTopUpButton(
                                text: 'Rp200.000', index: 5, nominal: 200000),
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
                  // onPressed: _submitTopUp,
                  onPressed: _showConfirmationDialog,
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
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(236, 232, 232, 1),
          title: const Text('Top up Confirmation'),
          content: const Text('Are you sure ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _submitTopUp();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromRGBO(236, 232, 232, 1),
                      title: const Text('Top Up Confirmation'),
                      content: const Text('Top Up Successfull!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Close',
                            style: TextStyle(
                              color: Color.fromRGBO(226, 42, 50, 1),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Color.fromRGBO(226, 42, 50, 1)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color.fromRGBO(84, 78, 78, 1)),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTopUpButton(
      {required String text, required int index, required int nominal}) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
          selectedNominal = nominal; // Simpan nominal yang dipilih
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

  void _submitTopUp() async {
    if (selectedNominal == 0) {
      print('No nominal selected');
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      print('Token not found');
      return;
    }

    final response = await http.post(
      Uri.parse('https://rent-it.site/api/auth/topup'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'nominal': selectedNominal}),
    );

    if (response.statusCode == 200) {
      print('Top up successful');
      // Navigasi kembali ke HomePage
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false,
      );
    } else {
      print('Failed to top up: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
}
