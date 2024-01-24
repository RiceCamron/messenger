import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          shadowColor: Color.fromARGB(0, 255, 255, 255),
          color: Color.fromRGBO(237, 242, 246, 1),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 60,
                  top: 8,
                  bottom: 20,
                ),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 10,
                child: Text(
                  "20.58",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              // Add the curved tail using CustomPaint
              Positioned(
                top: 29,
                left: 5,
                child: CustomPaint(
                  painter: CurvedTailPainter(),
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
      ..color = Color.fromRGBO(237, 242, 246, 1)// Set the color of the tail
      ..strokeWidth = 2.0;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(-5, 7)
      ..quadraticBezierTo(-10, 16, -20, 20)
      ..lineTo(20, 20)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
