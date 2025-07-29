/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:bingo/bloc/BingoBoard.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BingoBoards.g.dart';

@JsonSerializable()
class BingoBoards {
  final List<BingoBoard> boards;

  BingoBoards({required this.boards});

  bool doesBoardExist(String name) {
    for (int i = 0; i < boards.length; i++) {
      if (boards[i].name == name) {
        return true;
      }
    }
    return false;
  }

  BingoBoards copyWith({List<BingoBoard>? boards}) {
    return BingoBoards(boards: boards ?? this.boards);
  }

  factory BingoBoards.fromJson(Map<String, dynamic> json) =>
      _$BingoBoardsFromJson(json);
  Map<String, dynamic> toJson() => _$BingoBoardsToJson(this);
}
