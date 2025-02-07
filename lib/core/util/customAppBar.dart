import 'package:flutter/material.dart';

class CustomClipperExample extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height-23);
    path.quadraticBezierTo(
        size.width*.223, size.height*.65, size.width * 0.59, size.height - 38);
    path.quadraticBezierTo(
        size.width * 0.8, size.height , size.width, size.height-80);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Return true if the clipper needs to reclip
  }
}class CustomClipperExample1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height-27);
    path.quadraticBezierTo(
        size.width*.2, size.height*.69, size.width * 0.45, size.height - 33);
    path.quadraticBezierTo(
        size.width * 0.73, size.height , size.width, size.height-80);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Return true if the clipper needs to reclip
  }
}  