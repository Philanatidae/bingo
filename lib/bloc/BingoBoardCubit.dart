/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:bingo/bloc/BingoBoard.dart';
import 'package:bingo/bloc/BingoBoards.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class BingoBoardsCubit extends Cubit<BingoBoards> with HydratedMixin {
  BingoBoardsCubit() : super(BingoBoards(boards: [])) {
    hydrate();
  }

  void addBoard(BingoBoard board) {
    emit(state.copyWith(boards: [...state.boards, board]));
  }

  void updateBoard(int index, BingoBoard updatedBoard) {
    final updatedBoards = [...state.boards];
    updatedBoards[index] = updatedBoard;
    emit(state.copyWith(boards: updatedBoards));
  }

  void removeBoard(int index) {
    final updatedBoards = [...state.boards]..removeAt(index);
    emit(state.copyWith(boards: updatedBoards));
  }

  void clearBoards() {
    emit(state.copyWith(boards: []));
  }

  @override
  BingoBoards fromJson(Map<String, dynamic> json) => BingoBoards.fromJson(json);

  @override
  Map<String, dynamic> toJson(BingoBoards state) => state.toJson();
}
