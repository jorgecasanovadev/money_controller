import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import 'package:money_controller/src/ui/themes/themes.dart';

class ArcModel {
  ArcModel({required this.color, required this.value});

  final Color color;
  final double value;
}

class ArcPainterView extends CustomPainter {
  ArcPainterView({
    this.end = 270,
    this.width = 15,
    this.bgWidth = 10,
    this.blurWidth = 3,
    this.is180Arc = false,
    this.drawArcs,
    this.space = 5,
  });

  final double end;
  final double width;
  final double bgWidth;
  final double blurWidth;
  final bool is180Arc;
  final double space;
  final List<ArcModel>? drawArcs;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
      center: Offset(
        (size.width / 2),
        (is180Arc ? size.height : size.height / 2),
      ),
      radius: size.width / 2,
    );

    Paint backgroundPaint = Paint();
    backgroundPaint.color = grey100.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = (is180Arc ? bgWidth : width);
    backgroundPaint.strokeCap = StrokeCap.round;

    // InActive drawer
    canvas.drawArc(
      rect,
      radians(is180Arc ? 180 : 135),
      radians(is180Arc ? 180 : 270),
      false,
      backgroundPaint,
    );

    for (ArcModel drawArc in drawArcs ?? []) {
      // Variables converted
      double initial = (drawArc.value / end) + (is180Arc ? 180 : 135);
      double drawStart = initial;
      double activeDegrees = (drawArc.value / end) * (is180Arc ? 180 : 270);

      Paint activePaint = Paint();
      activePaint.color = drawArc.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;

      Paint shadowPaint = Paint()
        ..color = drawArc.color.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width + blurWidth
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

      // Draw Shadow Arc
      Path path = Path();

      if (!is180Arc) {
        path.addArc(rect, radians(initial), radians(activeDegrees + 1));
        canvas.drawPath(path, shadowPaint);
        // Active drawer
        canvas.drawArc(
          rect,
          radians(initial),
          radians(activeDegrees),
          false,
          activePaint,
        );
      }
      if (is180Arc) {
        path.addArc(rect, radians(drawStart), radians(activeDegrees - space));
        canvas.drawPath(path, shadowPaint);
        // Active drawer
        canvas.drawArc(
          rect,
          radians(drawStart),
          radians(activeDegrees - space),
          false,
          activePaint,
        );
      }

      drawStart = drawStart + space; //(drawArc.value / end) + space;
    }
  }

  @override
  bool shouldRepaint(ArcPainterView oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ArcPainterView oldDelegate) => false;
}
