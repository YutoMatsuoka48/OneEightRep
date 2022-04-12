import 'dart:math';

import 'package:one_eight/models/game_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class GameRepository {
  Future<Map<int, Symbol>> getSymbols();
  Future<Map<int, Gate>> getGates();
}

final gameRepositoryProvider = Provider((ref) => GameRepositoryImpl());

class GameRepositoryImpl implements GameRepository {
  GameRepositoryImpl();

  @override
  Future<Map<int, Symbol>> getSymbols() async {
    Map<int, Symbol> symbols = {};
    await Future.delayed(const Duration(milliseconds: 30));
    for (int i = 1; i <= 113; i++) {
      Symbol symbol = Symbol(-1, -1);
      symbols[i] = symbol;
    }
    symbols[13] = Symbol(1, 2);
    return symbols;
  }

  @override
  Future<Map<int, Gate>> getGates() async {
    Map<int, Gate> gates = {};
    await Future.delayed(const Duration(seconds: 2));
    for (int i = 1; i <= 32; i++) {
      Gate gate = Gate();
      for (int j = 1; j <= 2; j++) {
        gate.large.add(Pillar());
      }
      for (int j = 1; j <= 2; j++) {
        gate.middle.add(Pillar());
      }
      for (int j = 1; j <= 4; j++) {
        gate.small.add(Pillar());
      }
      gates[i] = gate;
    }
    gates[1]!.large[0].playerId = 4;
    return gates;
  }
}
