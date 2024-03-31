import 'package:flutter/material.dart';

class RWallet extends StatelessWidget {
  RWallet({super.key});

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
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(207, 207, 207, 1)),
                      padding: const EdgeInsets.all(4),
                      child: Icon(Icons.account_balance_wallet_outlined,
                          color: rRed, size: 25),
                    ),
                    const Text(
                      'Rp50.000',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth * 0.35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.upgrade,
                          size: 25,
                          color: rRed,
                        ),
                        Text(
                          'Bayar',
                          style: TextStyle(fontSize: 9, color: rRed),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.add, size: 25, color: rRed),
                        Text('Top-Up',
                            style: TextStyle(fontSize: 9, color: rRed))
                      ],
                    )
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
