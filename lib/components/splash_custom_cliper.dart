import 'package:flutter/material.dart';

class SlashCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    Path path = Path();
    path.lineTo(290, 2000);
    path.lineTo(70, 208);
    // path.lineTo(height + 10, width + 300);
    // path.quadraticBezierTo(width / 2, height, width, height - 50);
    // path.lineTo(100, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
