// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_eight/view_models/game_view_model.dart';
import 'package:one_eight/ui/components/game_widget/ui_common.dart';
import 'package:one_eight/ui/components/game_widget/pillar.dart';

class ActiveGateWidget extends HookConsumerWidget {
  const ActiveGateWidget({Key? key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(gameViewModelProvider.notifier);
    final state = ref.watch(gameViewModelProvider);

    return Align(
        //alignment: Alignment(alignX, alignY),
        alignment: _createAlignment(id),
        child: Transform.rotate(
            angle: 0 * pi / 180,
            child: ActiveGateTapGesture(
                id: id,
                child: Stack(
                  //alignment: AlignmentDirectional.center,
                  //alignment: Alignment(0, -0.5),
                  children: <Widget>[
                    // 盤
                    SizedBox(
                      width: GameWidgetConst.partsSize,
                      height: GameWidgetConst.partsSize,
                      child: CustomPaint(
                        painter: _ActiveGatePainter(),
                      ),
                    ),
                    //Image.asset('images/MarketParts.png'),
                    if (state.symbols[id] != null)
                      Positioned(
                        left: (GameWidgetConst.partsSize / 2) -
                            (GameWidgetConst.pillarSizeLarge() / 2),
                        top: (GameWidgetConst.partsSize / 4) -
                            (GameWidgetConst.pillarSizeLarge() / 2),
                        //alignment: Alignment(0, -0.5),
                        child: Transform.rotate(
                            angle: 45 * pi / 180,
                            child: PillarWidget(
                                playerId: state.gates[id]!.large[0].playerId,
                                pillarSize: PillarSize.large)),
                      ),
                    if (state.symbols[id] != null)
                      Positioned(
                        left: (GameWidgetConst.partsSize / 2) -
                            (GameWidgetConst.pillarSizeLarge() / 2),
                        top: (GameWidgetConst.partsSize * 3 / 4) -
                            (GameWidgetConst.pillarSizeLarge() / 2),
                        //alignment: Alignment(0, -0.5),
                        child: Transform.rotate(
                            angle: 45 * pi / 180,
                            child: PillarWidget(
                                playerId: state.gates[id]!.large[1].playerId,
                                pillarSize: PillarSize.large)),
                      ),
                    if (state.symbols[id] != null)
                      Positioned(
                        left: (GameWidgetConst.partsSize / 4) -
                            (GameWidgetConst.pillarSizeMiddle() / 2),
                        top: (GameWidgetConst.partsSize / 2) -
                            (GameWidgetConst.pillarSizeMiddle() / 2),
                        //alignment: Alignment(0, -0.5),
                        child: Transform.rotate(
                            angle: 45 * pi / 180,
                            child: PillarWidget(
                                playerId: state.gates[id]!.middle[0].playerId,
                                pillarSize: PillarSize.middle)),
                      ),
                    if (state.symbols[id] != null)
                      Positioned(
                        left: (GameWidgetConst.partsSize * 3 / 4) -
                            (GameWidgetConst.pillarSizeMiddle() / 2),
                        top: (GameWidgetConst.partsSize / 2) -
                            (GameWidgetConst.pillarSizeMiddle() / 2),
                        //alignment: Alignment(0, -0.5),
                        child: Transform.rotate(
                            angle: 45 * pi / 180,
                            child: PillarWidget(
                                playerId: state.gates[id]!.middle[1].playerId,
                                pillarSize: PillarSize.middle)),
                      ),
                    if (state.symbols[id] != null)
                      Positioned(
                        left: (GameWidgetConst.partsSize / 6) -
                            (GameWidgetConst.pillarSizeSmall() / 2),
                        top: (GameWidgetConst.partsSize / 6) -
                            (GameWidgetConst.pillarSizeSmall() / 2),
                        //alignment: Alignment(0, -0.5),
                        child: Transform.rotate(
                            angle: 45 * pi / 180,
                            child: PillarWidget(
                                playerId: state.gates[id]!.small[0].playerId,
                                pillarSize: PillarSize.small)),
                      ),
                    if (state.symbols[id] != null)
                      Positioned(
                        left: (GameWidgetConst.partsSize * 5 / 6) -
                            (GameWidgetConst.pillarSizeSmall() / 2),
                        top: (GameWidgetConst.partsSize / 6) -
                            (GameWidgetConst.pillarSizeSmall() / 2),
                        //alignment: Alignment(0, -0.5),
                        child: Transform.rotate(
                            angle: 45 * pi / 180,
                            child: PillarWidget(
                                playerId: state.gates[id]!.small[1].playerId,
                                pillarSize: PillarSize.small)),
                      ),
                    if (state.symbols[id] != null)
                      Positioned(
                        left: (GameWidgetConst.partsSize / 6) -
                            (GameWidgetConst.pillarSizeSmall() / 2),
                        top: (GameWidgetConst.partsSize * 5 / 6) -
                            (GameWidgetConst.pillarSizeSmall() / 2),
                        //alignment: Alignment(0, -0.5),
                        child: Transform.rotate(
                            angle: 45 * pi / 180,
                            child: PillarWidget(
                                playerId: state.gates[id]!.small[2].playerId,
                                pillarSize: PillarSize.small)),
                      ),
                    if (state.symbols[id] != null)
                      Positioned(
                        left: (GameWidgetConst.partsSize * 5 / 6) -
                            (GameWidgetConst.pillarSizeSmall() / 2),
                        top: (GameWidgetConst.partsSize * 5 / 6) -
                            (GameWidgetConst.pillarSizeSmall() / 2),
                        //alignment: Alignment(0, -0.5),
                        child: Transform.rotate(
                            angle: 45 * pi / 180,
                            child: PillarWidget(
                                playerId: state.gates[id]!.small[3].playerId,
                                pillarSize: PillarSize.small)),
                      ),
                  ],
                ))));
  }

  Alignment _createAlignment(int id) {
    // TODO
    return Alignment(
        GameWidgetConst.interval() * -4.35, GameWidgetConst.interval() * -4.35);
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

class ActiveGateTapGesture extends HookConsumerWidget {
  const ActiveGateTapGesture({Key? key, required this.id, required this.child});
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

class _ActiveGatePainter extends CustomPainter {
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
