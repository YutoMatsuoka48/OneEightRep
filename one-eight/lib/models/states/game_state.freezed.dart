// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameStateTearOff {
  const _$GameStateTearOff();

  _EditingGameState call(
      {bool isInit = true,
      bool isLoading = true,
      Map<int, Symbol> symbols = const {},
      Map<int, Gate> gates = const {},
      int turn = -1,
      int symbolTurn = -1,
      int turnPlayerId = -1,
      Map<int, Color> playerColor = const {}}) {
    return _EditingGameState(
      isInit: isInit,
      isLoading: isLoading,
      symbols: symbols,
      gates: gates,
      turn: turn,
      symbolTurn: symbolTurn,
      turnPlayerId: turnPlayerId,
      playerColor: playerColor,
    );
  }
}

/// @nodoc
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  bool get isInit => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Map<int, Symbol> get symbols => throw _privateConstructorUsedError;
  Map<int, Gate> get gates => throw _privateConstructorUsedError;
  int get turn => throw _privateConstructorUsedError;
  int get symbolTurn => throw _privateConstructorUsedError;
  int get turnPlayerId => throw _privateConstructorUsedError;
  Map<int, Color> get playerColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res>;
  $Res call(
      {bool isInit,
      bool isLoading,
      Map<int, Symbol> symbols,
      Map<int, Gate> gates,
      int turn,
      int symbolTurn,
      int turnPlayerId,
      Map<int, Color> playerColor});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;

  @override
  $Res call({
    Object? isInit = freezed,
    Object? isLoading = freezed,
    Object? symbols = freezed,
    Object? gates = freezed,
    Object? turn = freezed,
    Object? symbolTurn = freezed,
    Object? turnPlayerId = freezed,
    Object? playerColor = freezed,
  }) {
    return _then(_value.copyWith(
      isInit: isInit == freezed
          ? _value.isInit
          : isInit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      symbols: symbols == freezed
          ? _value.symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as Map<int, Symbol>,
      gates: gates == freezed
          ? _value.gates
          : gates // ignore: cast_nullable_to_non_nullable
              as Map<int, Gate>,
      turn: turn == freezed
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      symbolTurn: symbolTurn == freezed
          ? _value.symbolTurn
          : symbolTurn // ignore: cast_nullable_to_non_nullable
              as int,
      turnPlayerId: turnPlayerId == freezed
          ? _value.turnPlayerId
          : turnPlayerId // ignore: cast_nullable_to_non_nullable
              as int,
      playerColor: playerColor == freezed
          ? _value.playerColor
          : playerColor // ignore: cast_nullable_to_non_nullable
              as Map<int, Color>,
    ));
  }
}

/// @nodoc
abstract class _$EditingGameStateCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$EditingGameStateCopyWith(
          _EditingGameState value, $Res Function(_EditingGameState) then) =
      __$EditingGameStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isInit,
      bool isLoading,
      Map<int, Symbol> symbols,
      Map<int, Gate> gates,
      int turn,
      int symbolTurn,
      int turnPlayerId,
      Map<int, Color> playerColor});
}

/// @nodoc
class __$EditingGameStateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res>
    implements _$EditingGameStateCopyWith<$Res> {
  __$EditingGameStateCopyWithImpl(
      _EditingGameState _value, $Res Function(_EditingGameState) _then)
      : super(_value, (v) => _then(v as _EditingGameState));

  @override
  _EditingGameState get _value => super._value as _EditingGameState;

  @override
  $Res call({
    Object? isInit = freezed,
    Object? isLoading = freezed,
    Object? symbols = freezed,
    Object? gates = freezed,
    Object? turn = freezed,
    Object? symbolTurn = freezed,
    Object? turnPlayerId = freezed,
    Object? playerColor = freezed,
  }) {
    return _then(_EditingGameState(
      isInit: isInit == freezed
          ? _value.isInit
          : isInit // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      symbols: symbols == freezed
          ? _value.symbols
          : symbols // ignore: cast_nullable_to_non_nullable
              as Map<int, Symbol>,
      gates: gates == freezed
          ? _value.gates
          : gates // ignore: cast_nullable_to_non_nullable
              as Map<int, Gate>,
      turn: turn == freezed
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      symbolTurn: symbolTurn == freezed
          ? _value.symbolTurn
          : symbolTurn // ignore: cast_nullable_to_non_nullable
              as int,
      turnPlayerId: turnPlayerId == freezed
          ? _value.turnPlayerId
          : turnPlayerId // ignore: cast_nullable_to_non_nullable
              as int,
      playerColor: playerColor == freezed
          ? _value.playerColor
          : playerColor // ignore: cast_nullable_to_non_nullable
              as Map<int, Color>,
    ));
  }
}

/// @nodoc

class _$_EditingGameState extends _EditingGameState {
  _$_EditingGameState(
      {this.isInit = true,
      this.isLoading = true,
      this.symbols = const {},
      this.gates = const {},
      this.turn = -1,
      this.symbolTurn = -1,
      this.turnPlayerId = -1,
      this.playerColor = const {}})
      : super._();

  @JsonKey()
  @override
  final bool isInit;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final Map<int, Symbol> symbols;
  @JsonKey()
  @override
  final Map<int, Gate> gates;
  @JsonKey()
  @override
  final int turn;
  @JsonKey()
  @override
  final int symbolTurn;
  @JsonKey()
  @override
  final int turnPlayerId;
  @JsonKey()
  @override
  final Map<int, Color> playerColor;

  @override
  String toString() {
    return 'GameState(isInit: $isInit, isLoading: $isLoading, symbols: $symbols, gates: $gates, turn: $turn, symbolTurn: $symbolTurn, turnPlayerId: $turnPlayerId, playerColor: $playerColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditingGameState &&
            const DeepCollectionEquality().equals(other.isInit, isInit) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.symbols, symbols) &&
            const DeepCollectionEquality().equals(other.gates, gates) &&
            const DeepCollectionEquality().equals(other.turn, turn) &&
            const DeepCollectionEquality()
                .equals(other.symbolTurn, symbolTurn) &&
            const DeepCollectionEquality()
                .equals(other.turnPlayerId, turnPlayerId) &&
            const DeepCollectionEquality()
                .equals(other.playerColor, playerColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isInit),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(symbols),
      const DeepCollectionEquality().hash(gates),
      const DeepCollectionEquality().hash(turn),
      const DeepCollectionEquality().hash(symbolTurn),
      const DeepCollectionEquality().hash(turnPlayerId),
      const DeepCollectionEquality().hash(playerColor));

  @JsonKey(ignore: true)
  @override
  _$EditingGameStateCopyWith<_EditingGameState> get copyWith =>
      __$EditingGameStateCopyWithImpl<_EditingGameState>(this, _$identity);
}

abstract class _EditingGameState extends GameState {
  factory _EditingGameState(
      {bool isInit,
      bool isLoading,
      Map<int, Symbol> symbols,
      Map<int, Gate> gates,
      int turn,
      int symbolTurn,
      int turnPlayerId,
      Map<int, Color> playerColor}) = _$_EditingGameState;
  _EditingGameState._() : super._();

  @override
  bool get isInit;
  @override
  bool get isLoading;
  @override
  Map<int, Symbol> get symbols;
  @override
  Map<int, Gate> get gates;
  @override
  int get turn;
  @override
  int get symbolTurn;
  @override
  int get turnPlayerId;
  @override
  Map<int, Color> get playerColor;
  @override
  @JsonKey(ignore: true)
  _$EditingGameStateCopyWith<_EditingGameState> get copyWith =>
      throw _privateConstructorUsedError;
}
