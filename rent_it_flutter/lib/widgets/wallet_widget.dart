import 'package:flutter/material.dart';

class RWallet extends StatelessWidget {
  const RWallet({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          margin: const EdgeInsets.fromLTRB(40, 30, 40, 10),
          width: screenWidth,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(236, 232, 232, 1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color.fromRGBO(236, 232, 232, 1),
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
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(207, 207, 207, 1)),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.account_balance_wallet_outlined,
                    color: Color.fromRGBO(159, 21, 33, 1), size: 25),
              ),
              const Text('Rp50.000'),
              const Column(
                children: <Widget>[
                  Icon(
                    Icons.upgrade,
                    size: 25,
                    color: Color.fromRGBO(159, 21, 33, 1),
                  ),
                  Text(
                    'Bayar',
                    style: TextStyle(fontSize: 9),
                  )
                ],
              ),
              const Column(
                children: <Widget>[
                  Icon(Icons.add,
                      size: 25, color: Color.fromRGBO(159, 21, 33, 1)),
                  Text('Top-Up', style: TextStyle(fontSize: 9))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
