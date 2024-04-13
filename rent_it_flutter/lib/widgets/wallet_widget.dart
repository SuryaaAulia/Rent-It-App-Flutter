import 'package:flutter/material.dart';
import 'package:rent_it_flutter/page/payment_page.dart';
import 'package:rent_it_flutter/page/topup_page.dart';
import 'package:rent_it_flutter/widgets/icon_border_widget.dart';

class RWallet extends StatelessWidget {
  const RWallet({super.key});

  final rWhite = const Color.fromRGBO(236, 232, 232, 1);
  final rRed = const Color.fromRGBO(159, 21, 33, 1);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          width: screenWidth,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                    const Text(
                      'Rp50.000',
                      style: TextStyle(
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
