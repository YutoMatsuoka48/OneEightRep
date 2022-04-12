// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:one_eight/ui/components/game_widget/ui_common.dart';

class MirrorBoard extends StatelessWidget {
  const MirrorBoard({Key? key});

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
                painter: _MirrorBoardPainter(),
              ),
            ),
          ],
        ));
  }
}

class _MirrorBoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double bound = size.width;
    // 塗りつぶし
    final paint = Paint()..color = Colors.white;
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(bound, 0);
    path.lineTo(bound, bound);
    path.lineTo(0, bound);
    path.close();
    canvas.drawPath(path, paint);

    // 線
    final paint2 = Paint()
      ..color = Colors.black
      ..strokeWidth = 10;

    canvas.drawLine(const Offset(0, 0), Offset(bound, 0), paint2);
    canvas.drawLine(Offset(bound, 0), Offset(bound, bound), paint2);
    canvas.drawLine(Offset(bound, bound), Offset(0, bound), paint2);
    canvas.drawLine(Offset(0, size.height), const Offset(0, 0), paint2);

    canvas.drawLine(Offset(bound / 2, 0), Offset(0, bound / 2), paint2);
    canvas.drawLine(Offset(bound / 2, 0), Offset(bound, bound / 2), paint2);
    canvas.drawLine(Offset(bound / 4, bound / 4), Offset(0, bound), paint2);
    canvas.drawLine(Offset(bound / 4, bound / 4), Offset(bound, bound), paint2);
    canvas.drawLine(Offset(bound * 3 / 4, bound / 4), Offset(0, bound), paint2);
    canvas.drawLine(
        Offset(bound * 3 / 4, bound / 4), Offset(bound, bound), paint2);
    canvas.drawLine(Offset(0, bound / 2), Offset(bound, bound), paint2);
    canvas.drawLine(Offset(bound, bound / 2), Offset(0, bound), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
