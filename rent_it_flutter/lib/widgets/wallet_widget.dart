import 'package:flutter/material.dart';
import 'package:rent_it_flutter/pages/payment_page.dart';
import 'package:rent_it_flutter/pages/topup_page.dart';
import 'package:rent_it_flutter/widgets/icon_border_widget.dart';
import 'package:rent_it_flutter/widgets/shimmer_widget.dart';

class RWallet extends StatefulWidget {
  const RWallet({super.key});

  @override
  _RWalletState createState() => _RWalletState();
}

class _RWalletState extends State<RWallet> {
  bool isLoading = true;
  String balance = 'Rp50.000';

  @override
  void initState() {
    super.initState();
    _loadBalance();
  }

  Future<void> _loadBalance() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      balance = 'Rp50.000';
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const rWhite = Color.fromRGBO(236, 232, 232, 1);
    const rRed = Color.fromRGBO(159, 21, 33, 1);

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
                    const RIconBorder(
                        borderColor: Color.fromRGBO(207, 207, 207, 1),
                        iconColor: rRed,
                        iconType: Icons.account_balance_wallet_outlined,
                        borderStyle: BoxShape.circle),
                    isLoading
                        ? const RShimmerWidget.rectangle(width: 80, height: 16)
                        : Text(
                            balance,
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
                      child: const Column(
                        children: <Widget>[
                          RIconBorder(
                            borderColor: rRed,
                            iconColor: rWhite,
                            iconType: Icons.upgrade,
                            borderStyle: BoxShape.rectangle,
                            radius: BorderRadius.all(Radius.circular(4)),
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
                      child: const Column(
                        children: <Widget>[
                          RIconBorder(
                            borderColor: rRed,
                            iconColor: rWhite,
                            iconType: Icons.add,
                            borderStyle: BoxShape.rectangle,
                            radius: BorderRadius.all(Radius.circular(4)),
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
