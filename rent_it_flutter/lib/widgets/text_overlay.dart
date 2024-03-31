import 'package:flutter/material.dart';
import 'package:rent_it_flutter/widgets/icon_border_widget.dart';

class RBottomTextOverlay extends StatelessWidget {
  const RBottomTextOverlay({
    super.key,
    required this.color,
    required this.namaGedung,
    required this.descGedung,
  });

  final Color color;
  final String namaGedung;
  final String descGedung;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 5,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                namaGedung,
                style: TextStyle(color: color, fontSize: 20),
              ),
              Text(
                descGedung,
                style: TextStyle(
                    color: color, fontSize: 11, fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RTopTextOverlay extends StatelessWidget {
  const RTopTextOverlay({
    super.key,
    required this.screenWidth,
    required this.color,
    required this.tanggal,
    required this.waktu,
  });

  final double screenWidth;
  final Color color;
  final String tanggal;
  final String waktu;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: screenWidth * 0.85,
        top: 5,
        right: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RIconBorder(
                borderColor: Colors.transparent,
                iconColor: color,
                iconType: Icons.more_horiz,
                borderStyle: BoxShape.rectangle),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(tanggal,
                    style: TextStyle(
                        color: color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text(waktu,
                    style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontWeight: FontWeight.w200)),
              ],
            ),
          ],
        ));
  }
}
