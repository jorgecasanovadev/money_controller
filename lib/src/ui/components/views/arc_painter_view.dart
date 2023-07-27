import 'package:flutter/material.dart';
import 'package:money_controller/src/ui/themes/themes.dart';

class ArcPainterView extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    var gradientColor = const LinearGradient(
      colors: [mainSecondary, darkBlueGrey, green100],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    Paint activePaint = Paint()..shader = gradientColor.createShader(rect);

    activePaint.style = PaintingStyle.stroke;
  }

  @override
  bool shouldRepaint(ArcPainterView oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ArcPainterView oldDelegate) => false;
}
