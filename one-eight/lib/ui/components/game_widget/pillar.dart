// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:one_eight/ui/components/game_widget/ui_common.dart';

class PillarWidget extends StatelessWidget {
  const PillarWidget(
      {Key? key, required this.playerId, this.pillarSize = PillarSize.middle});
  final int playerId;
  final PillarSize pillarSize;

  @override
  Widget build(BuildContext context) {
    double size;
    switch (pillarSize) {
      case PillarSize.large:
        size = GameWidgetConst.pillarSizeLarge();
        break;
      case PillarSize.middle:
        size = GameWidgetConst.pillarSizeMiddle();
        break;
      case PillarSize.small:
        size = GameWidgetConst.pillarSizeSmall();
        break;
    }

    _PillarPainter painter = _PillarPainter();
    painter.color = GameWidgetConst.playerColor[playerId] == null
        ? Colors.white
        : GameWidgetConst.playerColor[playerId]!;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        //Image.asset('images/Symbol.png'),
        Container(
          width: size,
          height: size,
          child: CustomPaint(
            painter: painter,
          ),
        ),
      ],
    );
  }
}

class _PillarPainter extends CustomPainter {
  Color color = Colors.white;
  Color borderColor = Colors.black;

  @override
  void paint(Canvas canvas, Size size) {
    double bound = size.width;
    // 塗りつぶし
    final paint = Paint()..color = color;
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(bound, 0);
    path.lineTo(bound, bound);
    path.lineTo(0, bound);
    path.close();
    canvas.drawPath(path, paint);

    // 線
    final paint2 = Paint()
      ..color = borderColor
      ..strokeWidth = 3;

    canvas.drawLine(const Offset(0, 0), Offset(bound, 0), paint2);
    canvas.drawLine(Offset(bound, 0), Offset(bound, bound), paint2);
    canvas.drawLine(Offset(bound, bound), Offset(0, bound), paint2);
    canvas.drawLine(Offset(0, bound), const Offset(0, 0), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
