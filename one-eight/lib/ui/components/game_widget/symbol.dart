// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:one_eight/ui/components/game_widget/ui_common.dart';

@immutable
class SymbolWidget extends StatelessWidget {
  const SymbolWidget(
      {Key? key,
      required this.turn,
      required this.playerId,
      this.symbolSize = SymbolSize.middle});
  final int turn;
  final int playerId;
  final SymbolSize symbolSize;

  @override
  Widget build(BuildContext context) {
    double size;
    switch (symbolSize) {
      case SymbolSize.large:
        size = GameWidgetConst.symbolSizeLarge();
        break;
      case SymbolSize.middle:
        size = GameWidgetConst.symbolSizeMiddle();
        break;
      case SymbolSize.small:
        size = GameWidgetConst.symbolSizeSmall();
        break;
    }

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        //Image.asset('images/Symbol.png'),
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: GameWidgetConst.playerColor[playerId],
          ),
        ),
        Container(
            width: size * 2 / 3,
            height: size * 2 / 3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.white),
            ),
            child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.contain,
                child: Text(turn.toString().padLeft(2, "0"))))
      ],
    );
  }
}
