import 'package:flutter/material.dart';

class RClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path_0 = Path();
    double w = size.width;
    double h = size.height;

    path_0.moveTo(w * 0, h * 0);
    path_0.lineTo(0, h);
    path_0.quadraticBezierTo(w * 0.2, h * 0.8, w * 0.5, h * 0.8);
    path_0.quadraticBezierTo(w * 0.8, h * 0.8, w, h);
    path_0.lineTo(w, h * 0);
    path_0.lineTo(w * 0, h * 0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RClipPathLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.quadraticBezierTo(size.width * 0.7204167, size.height * 0.4964286,
        size.width * 0.6250000, size.height * 0.3628571);
    path_0.quadraticBezierTo(
        size.width * 0.5054167, size.height * 0.2135714, 0, 0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
