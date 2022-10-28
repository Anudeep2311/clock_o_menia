import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockPaint(),
      ),
    );
  }
}
class ClockPaint extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width /2;
    var centreY = size.height/2;
    var centre = Offset(centerX,centreY);
    var radius = min(centerX,centreY);

    var fillBrush = Paint()
      ..color = Color(0xFF444974);

    var OutlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth =16;

    var centreBrush = Paint()
      ..color = Color(0xFFEAECFF);

    var hrHandBrush = Paint()
      ..color = Colors.orange
      ..shader = RadialGradient(colors: [Colors.orange,Colors.pink])
          .createShader(Rect.fromCircle(center: centre, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth=16;

    var minHandBrush = Paint()
      ..color = Colors.green
      ..shader = RadialGradient(colors: [Colors.greenAccent,Colors.pink])
          .createShader(Rect.fromCircle(center: centre, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth=16;

    var secHandBrush = Paint()
      ..color = Colors.purple
      ..shader = RadialGradient(colors: [Colors.greenAccent,Colors.pink])
          .createShader(Rect.fromCircle(center: centre, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth=16;


    canvas.drawCircle(centre, radius-40, fillBrush);

    canvas.drawCircle(centre, radius-40, OutlineBrush);


    var seHandX = centerX + 80 * cos (dateTime.second * 6 * pi/180);
    var seHandY = centerX + 80* sin (dateTime.second * 6 * pi/180);

    var miHandX = centerX + 80 * cos (dateTime.minute * 6 * pi/180);
    var miHandY = centerX + 80 * sin (dateTime.minute * 6 * pi/180);


    var hrHandX = centerX + 60* cos ((dateTime.hour *30 + dateTime.minute * 0.5) *pi/180);
    var hrHandY = centerX + 60* sin ((dateTime.hour *30 + dateTime.minute * 0.5)*pi/180);





    canvas.drawLine(centre, Offset(hrHandX, hrHandY), hrHandBrush);

    canvas.drawLine(centre, Offset(miHandX, miHandY), minHandBrush);

    canvas.drawLine(centre, Offset(seHandX, seHandY), secHandBrush);

    canvas.drawCircle(centre, 16, centreBrush);

    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
