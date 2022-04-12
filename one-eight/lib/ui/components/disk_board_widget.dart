// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:one_eight/ui/components/game_widget/ui_common.dart';

class DiskBoard extends StatelessWidget {
  const DiskBoard({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: GameWidgetConst.boardSize(),
        height: GameWidgetConst.boardSize(),
        child: Stack(
          children: [
            SizedBox(
              width: GameWidgetConst.boardSize(),
              height: GameWidgetConst.boardSize(),
              child: CustomPaint(
                painter: _DiskBoardPainter(),
              ),
            ),
          ],
        ));
  }
}

class _DiskBoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double bound = size.width;
    // 円（塗りつぶし）
    final paint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(bound / 2, bound / 2), bound / 2, paint);

    // 円（外線）
    final paint2 = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(Offset(bound / 2, bound / 2), bound / 2, paint2);
    canvas.drawCircle(Offset(bound / 2, bound / 2), bound / 4, paint2);

    double r = bound / 2;
    double tmp = r * (1 / sqrt(2));
    canvas.drawLine(Offset(tmp + r, tmp + r), Offset(r - tmp, r - tmp), paint2);
    canvas.drawLine(Offset(r - tmp, tmp + r), Offset(tmp + r, r - tmp), paint2);
    canvas.drawLine(Offset(bound / 2, 0), Offset(bound / 2, bound), paint2);
    canvas.drawLine(Offset(0, bound / 2), Offset(bound, bound / 2), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
