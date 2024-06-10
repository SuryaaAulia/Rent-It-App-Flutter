import 'package:flutter/material.dart';

class RIconBorder extends StatelessWidget {
  const RIconBorder(
      {super.key,
      this.borderColor,
      required this.iconColor,
      required this.iconType,
      required this.borderStyle,
      this.radius,
      this.lineBorder});

  final Color? borderColor;
  final Color iconColor;
  final IconData iconType;
  final BoxShape borderStyle;
  final BorderRadius? radius;
  final Border? lineBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: borderStyle,
          borderRadius: radius,
          color: borderColor,
          border: lineBorder),
      child: Icon(iconType, color: iconColor, size: 25),
    );
  }
}
