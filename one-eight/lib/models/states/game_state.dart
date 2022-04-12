import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:one_eight/models/game_model.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const GameState._();

  factory GameState({
    @Default(true) bool isInit,
    @Default(true) bool isLoading,
    @Default({}) Map<int, Symbol> symbols,
    @Default({}) Map<int, Gate> gates,
    @Default(-1) int turn,
    @Default(-1) int symbolTurn,
    @Default(-1) int turnPlayerId,
    @Default({}) Map<int, Color> playerColor,
  }) = _EditingGameState;
}
