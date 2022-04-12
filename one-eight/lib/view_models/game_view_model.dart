import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:one_eight/models/states/game_state.dart';
import 'package:one_eight/models/game_model.dart';
import 'package:flutter/foundation.dart';
import 'package:one_eight/repositories/game_repository.dart';

abstract class GameViewModel {
  Future<void> getSymbols({
    isInit = false,
    isLoading = false,
  });
  Future<void> getGates({
    isInit = false,
    isLoading = false,
  });
  void setSymbol(int id, int turn, int playerId);
}

final gameViewModelProvider =
    StateNotifierProvider.autoDispose<GameViewModelImpl, GameState>(
        (ref) => GameViewModelImpl(ref.read));

class GameViewModelImpl extends StateNotifier<GameState>
    implements GameViewModel {
  GameViewModelImpl(this._reader) : super(GameState());

  final Reader _reader;

  late final GameRepository _gameRepository = _reader(gameRepositoryProvider);

  bool isLoadingSymbols = false;
  bool isLoadingGates = false;

  setInit() async {
    isLoadingSymbols = true;
    isLoadingGates = true;
    state = state.copyWith(isInit: true, isLoading: _isLoadingState());
  }

  bool _isLoadingState() {
    return isLoadingSymbols || isLoadingGates;
  }

  @override
  Future<void> getSymbols({
    isInit = false,
    isLoading = false,
  }) async {
    isLoadingSymbols = isLoading;
    state = state.copyWith(isInit: isInit, isLoading: _isLoadingState());

    try {
      Map<int, Symbol> allSymbols = <int, Symbol>{...state.symbols};
      Map<int, Symbol> symbols;

      if (isInit) {
        allSymbols.clear();
      }

      symbols = await _gameRepository.getSymbols();

      isLoadingSymbols = false;
      state = state.copyWith(
        isInit: false,
        isLoading: _isLoadingState(),
        symbols: allSymbols..addAll(symbols),
        //exception: null,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(
        isLoading: _isLoadingState(),
        //exception: AppException(innerException: e, message: '一覧の取得に失敗しました'),
      );
    } catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(
        isLoading: false,
        //exception: AppException(message: '一覧の取得に失敗しました'),
      );
    }
  }

  @override
  void setSymbol(int id, int turn, int playerId) {
    //state.symbols[id] = Symbol(turn, playerId);
    Map<int, Symbol> newSymbols = state.symbols;
    newSymbols[id] = Symbol(turn, Random().nextInt(4) + 1);
    state = state.copyWith(
      isLoading: false,
      symbols: newSymbols,
    );
  }

  @override
  Future<void> getGates({
    isInit = false,
    isLoading = false,
  }) async {
    isLoadingGates = isLoading;
    state = state.copyWith(isInit: isInit, isLoading: _isLoadingState());

    try {
      Map<int, Gate> allGates = <int, Gate>{...state.gates};
      Map<int, Gate> gates;

      if (isInit) {
        allGates.clear();
      }

      gates = await _gameRepository.getGates();

      isLoadingGates = false;
      state = state.copyWith(
        isInit: false,
        isLoading: _isLoadingState(),
        gates: allGates..addAll(gates),
        //exception: null,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(
        isLoading: false,
        //exception: AppException(innerException: e, message: '一覧の取得に失敗しました'),
      );
    } catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(
        isLoading: false,
        //exception: AppException(message: '一覧の取得に失敗しました'),
      );
    }
  }
}
