// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:one_eight/models/game_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_eight/view_models/game_view_model.dart';
import 'package:one_eight/ui/components/game_widget/market_partsA.dart';
import 'package:one_eight/ui/components/game_widget/market_partsB.dart';
import 'package:one_eight/ui/components/game_widget/market_partsC.dart';
import 'package:one_eight/ui/components/game_widget/active_gate.dart';
import 'package:one_eight/ui/components/game_widget/ui_common.dart';

@immutable
class MarketBoard extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: GameWidgetConst.boardSize(),
        height: GameWidgetConst.boardSize(),
        child: Stack(
          children: [
            //MarketParts(id: 1, symbolData: SymbolData(1, 1)),
            for (var i = 1; i <= 113; i++) MarketPartsA(id: i),
            for (var i = 1; i <= 28; i++) MarketPartsB(id: i),
            for (var i = 1; i <= 4; i++) MarketPartsC(id: i),
            ActiveGateWidget(id: 1),
          ],
        ));
  }
}
