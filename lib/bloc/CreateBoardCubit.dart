/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:math' as math;

import 'package:bingo/bloc/BingoBoard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair/pair.dart';

class CreateBoardCubit extends Cubit<BingoBoard> {
  final List<Pair<BoardType, String>> _boardTypes = <Pair<BoardType, String>>[
    Pair<BoardType, String>(BoardType.numbers, 'Numbers'),
    Pair<BoardType, String>(BoardType.names, 'Names'),
  ];

  final List<Pair<int, String>> _boardSizes = <Pair<int, String>>[
    Pair<int, String>(3, '3x3'),
    Pair<int, String>(4, '4x4'),
    Pair<int, String>(5, '5x5'),
    Pair<int, String>(6, '6x6'),
  ];

  CreateBoardCubit()
    : super(BingoBoard(name: '', type: BoardType.numbers, gridSize: 5));

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateType(BoardType type) {
    emit(state.copyWith(type: type));
  }

  void updateGridSize(int gridSize) {
    emit(state.copyWith(gridSize: gridSize));
  }

  void resetBoard() {
    emit(BingoBoard(name: '', type: BoardType.names, gridSize: 5));
  }

  List<Pair<BoardType, String>> getBoardTypes() {
    return _boardTypes;
  }
  int getTypeIndex() {
    return _boardTypes.indexWhere((pair) => pair.key == state.type);
  }
  void updateTypeFromIndex(int index) {
    // @todo Error checking
    final cappedIndex = math.min(math.max(index, 0), _boardTypes.length - 1);
    updateType(_boardTypes[cappedIndex].key);
  }

  List<Pair<int, String>> getBoardSizes() {
    return _boardSizes;
  }
  int getSizeIndex() {
    return _boardSizes.indexWhere((pair) => pair.key == state.gridSize);
  }
  void updateSizeFromIndex(int index) {
    // @todo Error checking
    final cappedIndex = math.min(math.max(index, 0), _boardSizes.length - 1);
    updateGridSize(_boardSizes[cappedIndex].key);
  }
}
