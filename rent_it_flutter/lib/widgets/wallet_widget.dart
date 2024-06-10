import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/payment_page.dart';
import 'package:rent_it_flutter/page/topup_page.dart';
import 'package:rent_it_flutter/widgets/icon_border_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:money_formatter/money_formatter.dart';

class RWallet extends StatefulWidget {
  const RWallet({super.key});

  @override
  State<RWallet> createState() => _RWalletState();
}

class _RWalletState extends State<RWallet> {
  late final Timer _timer;
  final rWhite = const Color.fromRGBO(236, 232, 232, 1);
  final rRed = const Color.fromRGBO(159, 21, 33, 1);
  String balanceFormatted = '';

  @override
  void initState() {
    super.initState();
    _getWalletInfo();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _getWalletInfo();
    });
  } 
  
  @override
  void dispose() {
    // Hentikan timer saat widget di dispose untuk menghindari memory leak
    _timer.cancel();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 8, 10),
          width: screenWidth * 0.9,
          padding: const EdgeInsets.fromLTRB(20, 5, 8, 5),
          decoration: BoxDecoration(
              color: rWhite,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: rWhite,
              ),
              boxShadow: [
                const BoxShadow(
                    color: Color.fromRGBO(77, 75, 75, 1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2)),
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(-5, 0),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth * 0.35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RIconBorder(
                        borderColor: const Color.fromRGBO(207, 207, 207, 1),
                        iconColor: rRed,
                        iconType: Icons.account_balance_wallet_outlined,
                        borderStyle: BoxShape.circle),
                    Text(
                      'Rp$balanceFormatted',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromRGBO(84, 78, 78, 1)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth * 0.35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentPage()),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          RIconBorder(
                            borderColor: rRed,
                            iconColor: rWhite,
                            iconType: Icons.upgrade,
                            borderStyle: BoxShape.rectangle,
                            radius: const BorderRadius.all(Radius.circular(4)),
                          ),
                          Text(
                            'Bayar',
                            style: TextStyle(fontSize: 9, color: rRed),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TopUpPage()),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          RIconBorder(
                            borderColor: rRed,
                            iconColor: rWhite,
                            iconType: Icons.add,
                            borderStyle: BoxShape.rectangle,
                            radius: const BorderRadius.all(Radius.circular(4)),
                          ),
                          Text(
                            'Top-Up',
                            style: TextStyle(fontSize: 9, color: rRed),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
