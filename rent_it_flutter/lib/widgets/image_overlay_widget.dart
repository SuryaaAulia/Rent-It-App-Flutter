import 'package:flutter/material.dart';

class ROverlayImage extends StatelessWidget {
  const ROverlayImage({
    super.key,
    required this.screenWidth,
    required this.image,
  });

  final double screenWidth;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
