import 'package:flutter/material.dart';

class RClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path combinedPath = Path();

    // Path pertama
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0012250, size.height * 0.0020143);
    path_0.lineTo(size.width * -0.0012250, size.height * 0.1434429);
    path_0.lineTo(size.width * -0.0012250, size.height * 0.2877286);
    path_0.quadraticBezierTo(size.width * 0.3407417, size.height * 0.3111857,
        size.width * 0.4998333, size.height * 0.4227571);
    path_0.quadraticBezierTo(size.width * 0.7315333, size.height * 0.4839429,
        size.width * 0.9994583, size.height * 0.7163000);
    path_0.lineTo(size.width * 0.9987750, size.height * 0.5748714);
    path_0.lineTo(size.width * 0.9987750, size.height * 0.4277286);
    path_0.lineTo(size.width * 0.9987750, size.height * 0.2863000);
    path_0.lineTo(size.width * 0.9987750, size.height * 0.2163000);
    path_0.lineTo(size.width * 0.9979417, size.height * 0.0734429);
    path_0.lineTo(size.width * 0.9979417, size.height * 0.0020143);
    path_0.lineTo(size.width * 0.3321083, size.height * 0.0005857);
    path_0.lineTo(size.width * -0.0012250, size.height * 0.0020143);
    path_0.close();

    // Path kedua
    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0005333, size.height * 0.0011571);
    path_1.lineTo(size.width * -0.0005333, size.height * 0.1411571);
    path_1.lineTo(size.width * -0.0005333, size.height * 0.2883000);
    path_1.quadraticBezierTo(size.width * 0.1823333, size.height * 0.1761143,
        size.width * 0.5008000, size.height * 0.2119571);
    path_1.quadraticBezierTo(size.width * 0.7900500, size.height * 0.1865571,
        size.width * 0.9991667, size.height * 0.2873857);
    path_1.lineTo(size.width * 0.9978000, size.height * 0.0025857);
    path_1.lineTo(size.width * 0.5006333, size.height * 0.0043000);
    path_1.lineTo(size.width * -0.0005333, size.height * 0.0011571);
    path_1.close();

    combinedPath.addPath(path_0, Offset.zero);
    combinedPath.addPath(path_1, Offset.zero);

    return combinedPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Warna untuk path pertama
    Paint paint_0 = Paint()
      ..color = const Color.fromARGB(255, 226, 42, 50)
      ..style = PaintingStyle.fill;

    // Warna untuk path kedua
    Paint paint_1 = Paint()
      ..color = const Color.fromARGB(255, 159, 21, 33)
      ..style = PaintingStyle.fill;

    Path combinedPath = getClip(size);

    // Gambar combinedPath dengan warna
    canvas.drawPath(combinedPath, paint_0);

    // Gambar path kedua dengan warna
    // canvas.drawPath(path_1, paint_1);
  }
}
