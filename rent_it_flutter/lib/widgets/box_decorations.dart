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
