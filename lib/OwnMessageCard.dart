import 'dart:typed_data';

import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key, required this.message}) : super(key: key);
  final String message;
  // final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          color:Color.fromRGBO(60, 237, 120, 1),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 60,
                top: 8,
                bottom: 20,
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 2,
              right: 10,
              child: Row(
                children: [
                  Text(
                    "20.58",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),

          Positioned(
                top: 9,
                left: 100,
                child: CustomPaint(
                  painter: CurvedTailPainter(),
                ),
              ),
                  Icon(
                    Icons.done_all,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
          ),
      ),
    );
  }
}

class CurvedTailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color.fromRGBO(237, 242, 246, 1) // Set the color of the tail
      ..strokeWidth = 2.0;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(5, 7) // Измените знак для lineTo
      ..quadraticBezierTo(10, 16, 20, 20) // Измените знаки для quadraticBezierTo
      ..lineTo(-20, 20) // Измените знак для lineTo
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
