// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_eight/view_models/game_view_model.dart';
import 'package:one_eight/ui/components/game_widget/ui_common.dart';
import 'package:one_eight/ui/components/game_widget/symbol.dart';

class MarketPartsA extends HookConsumerWidget {
  const MarketPartsA({
    Key? key,
    required this.id,
  });
  //this.symbolData});
  final int id;
  //final Symbol? symbolData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(gameViewModelProvider.notifier);
    final state = ref.watch(gameViewModelProvider);
    return Align(
        //alignment: Alignment(alignX, alignY),
        alignment: _createAlignment(id),
        child: Transform.rotate(
            angle: 45 * pi / 180,
            child: MarketTapGesture(
                id: id,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    // 盤
                    SizedBox(
                      width: GameWidgetConst.partsSize,
                      height: GameWidgetConst.partsSize,
                      child: CustomPaint(
                        painter: _MarketBoardPartsAPainter(),
                      ),
                    ),
                    //Image.asset('images/MarketParts.png'),
                    if (state.symbols[id] != null &&
                        state.symbols[id]!.playerId != -1)
                      Transform.rotate(
                          angle: -45 * pi / 180,
                          child: SymbolWidget(
                              turn: state.symbols[id]!.turn,
                              playerId: state.symbols[id]!.playerId,
                              symbolSize: SymbolSize.middle)),
                  ],
                ))));
  }

  Alignment _createAlignment(int id) {
    int quo15 = (id - 1) ~/ 15;
    int mod15 = (id - 1) % 15;
    int quo8 = mod15 ~/ 8;
    int mod8 = mod15 % 8;
    double alignY = quo15 - 3.5 + (quo8 * 0.5);
    double alignX = mod8 - (quo8 == 0 ? 3.5 : 3);
    return Alignment(GameWidgetConst.interval() * alignX,
        GameWidgetConst.interval() * alignY);
  }
}

class _MarketBoardPartsAPainter extends CustomPainter {
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
      ..strokeWidth = 3;

    canvas.drawLine(Offset(bound / 2, 0), Offset(bound / 2, bound), paint2);
    canvas.drawLine(Offset(0, bound / 2), Offset(bound, bound / 2), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MarketTapGesture extends HookConsumerWidget {
  const MarketTapGesture({Key? key, required this.id, required this.child});
  final int id;
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(gameViewModelProvider.notifier);
    final state = ref.watch(gameViewModelProvider);
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text("タップ"),
                content: Text("タップID：" + id.toString()),
                actions: <Widget>[
                  // ボタン領域
                  FlatButton(
                      child: const Text("Cancel"),
                      onPressed: () => {
                            Navigator.pop(context),
                          }),
                  FlatButton(
                      child: const Text("OK"),
                      onPressed: () => {
                            viewModel.setSymbol(id, 99, 1),
                            Navigator.pop(context),
                          }),
                ],
              );
            },
          );
        },
        child: child);
  }
}
