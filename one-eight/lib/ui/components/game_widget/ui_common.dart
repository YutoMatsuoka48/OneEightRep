import 'package:flutter/material.dart';
import 'dart:math';

enum PartsLocatin { top, bottom, left, right }
enum SymbolSize { large, middle, small }
enum PillarSize { large, middle, small }

class GameWidgetConst {
  // static const double boardSize = 1300;
  static const double partsSize = 200;
  static const Map<int, Color> playerColor = {
    1: Colors.red,
    2: Colors.blue,
    3: Colors.yellow,
    4: Colors.green,
  };
  //static const double interval = 0.184615;
  //static const double symbolSizeLarge = 30;
  //static const double symbolSizeMiddle = partsSize / ;
  //static const double symbolSizeSmall = 10;

  static const double _marginSize = 5;

  static double symbolSizeLarge() {
    return partsSize / sqrt(pow(1, 2) * 2) * 4 / 3;
  }

  static double symbolSizeMiddle() {
    return partsSize / sqrt(pow(1, 2) * 2);
  }

  static double symbolSizeSmall() {
    return partsSize / sqrt(pow(1, 2) * 2) * 2 / 3;
  }

  static double pillarSizeLarge() {
    return partsSize / 3.5;
  }

  static double pillarSizeMiddle() {
    return partsSize / 5;
  }

  static double pillarSizeSmall() {
    return partsSize / 9;
  }

  static double interval() {
    double longBound = sqrt(pow(partsSize, 2) * 2);
    double board = boardSize();
    double tmp = longBound * 2.16 / board;
    return tmp;
  }

  static double boardSize() {
    double longBound = sqrt(pow(partsSize, 2) * 2);
    double boardSize =
        (longBound * 8) + ((longBound * 3 / 4) * 2) + (_marginSize * 2);
    return boardSize;
  }
}
