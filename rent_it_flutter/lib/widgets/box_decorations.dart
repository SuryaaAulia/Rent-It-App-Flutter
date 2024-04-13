import 'package:flutter/material.dart';

final BoxDecoration redRoundedDropdownDecoration = BoxDecoration(
  color: Colors.red,
  borderRadius: BorderRadius.circular(15.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ],
);

BoxDecoration getImageRoundedWithShadowDecoration(String selectedValue) {
  String imagePath;
  switch (selectedValue) {
    case 'Gedung Serbaguna':
      imagePath = 'assets/images/GSG.jpg';
      break;
    case 'Lapangan Tennis':
      imagePath = 'assets/images/Lapangan_Tennis.jpg';
      break;
    case 'Lapangan Bulutangkis':
      imagePath = 'assets/images/Lapangan_Bulutangkis.jpg';
      break;
    case 'TULT':
      imagePath = 'assets/images/TULT.jpg';
      break;
    default:
      imagePath = 'assets/images/default_image.jpg';
  }

  return BoxDecoration(
    color: Colors.white.withOpacity(0.8),
    borderRadius: BorderRadius.circular(15.0),
    image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
    ),
  );
}

final BoxDecoration whiteRoundedWithShadowDecoration = BoxDecoration(
  color: Colors.white.withOpacity(0.8),
  borderRadius: BorderRadius.circular(15.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ],
);

final BoxDecoration darkenedBackgroundDecoration = BoxDecoration(
  color: Colors.black.withOpacity(0.5),
  backgroundBlendMode: BlendMode.darken,
);

final BoxDecoration redRoundedButtonDecoration = BoxDecoration(
  color: Colors.red,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ],
);
