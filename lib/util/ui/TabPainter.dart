import 'dart:ui';

import 'package:flutter/cupertino.dart';

class TabPainter extends CustomPainter {
  final Color color;

  TabPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, .5 * size.height);
    path.quadraticBezierTo(0, 0, .1 * size.width, 0);
    path.lineTo(.48 * size.width, 0);
    path.quadraticBezierTo(
        .512 * size.width, 0, .52 * size.width, .1 * size.height);
    path.lineTo(.57 * size.width, .83 * size.height);
    path.quadraticBezierTo(
        .58 * size.width, .9 * size.height, .59 * size.width, .9 * size.height);
    path.lineTo(size.width, .9 * size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}