import 'package:flutter/material.dart';

class CustomCornerClipPath extends CustomClipper<Path> {
  final double cornerR;
  const CustomCornerClipPath({this.cornerR = 16.0});

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: Offset(0.0, size.height/2), radius: 20.0));
    path.addOval(Rect.fromCircle(center: Offset(size.width, size.height/2), radius: 20.0));

    return path;
  }


  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
