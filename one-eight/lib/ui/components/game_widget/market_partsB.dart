// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:one_eight/ui/components/game_widget/ui_common.dart';

class MarketPartsB extends StatelessWidget {
  const MarketPartsB({Key? key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: _createAlignment(id),
        child: Transform.rotate(
            angle: _createAngle(id),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                // 盤
                SizedBox(
                  width: GameWidgetConst.partsSize,
                  height: GameWidgetConst.partsSize,
                  child: CustomPaint(
                    painter: _MarketBoardPartsBPainter(),
                  ),
                ),
                //Image.asset('images/MarketParts.png'),
              ],
            )));
  }

  Alignment _createAlignment(int id) {
    int quo7 = (id - 1) ~/ 7;
    int mod7 = (id - 1) % 7;
    double alignY = 0;
    double alignX = 0;
    switch (quo7) {
      case 0:
        alignY = -4;
        break;
      case 1:
        alignX = 4;
        break;
      case 2:
        alignY = 4;
        break;
      case 3:
        alignX = -4;
        break;
    }
    if (quo7 == 0 || quo7 == 2) {
      alignX = mod7 - 3;
    } else {
      alignY = mod7 - 3;
    }

    return Alignment(GameWidgetConst.interval() * alignX,
        GameWidgetConst.interval() * alignY);
  }

  double _createAngle(int id) {
    double angle = 45;
    int quo7 = (id - 1) ~/ 7;
    switch (quo7) {
      case 0:
        angle = -45 * pi / 180;
        break;
      case 1:
        angle = 45 * pi / 180;
        break;
      case 2:
        angle = 135 * pi / 180;
        break;
      case 3:
        angle = -135 * pi / 180;
        break;
    }
    return angle;
  }
}

class _MarketBoardPartsBPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double bound = size.width;
    final paint = Paint()..color = Colors.white;
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, bound);
    path.lineTo(bound, bound);
    path.close();
    canvas.drawPath(path, paint);

    final paint2 = Paint()
      ..color = Colors.black
      ..strokeWidth = 3;

    canvas.drawLine(Offset(0, bound / 2), Offset(bound / 2, bound / 2), paint2);
    canvas.drawLine(
        Offset(bound / 2, bound), Offset(bound / 2, bound / 2), paint2);
    canvas.drawLine(const Offset(0, 0), Offset(bound, bound), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
