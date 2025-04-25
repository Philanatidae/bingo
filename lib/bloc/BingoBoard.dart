/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:json_annotation/json_annotation.dart';

part 'BingoBoard.g.dart';

enum BoardType { names, numbers }

@JsonSerializable()
class BingoBoard {
  final String name;
  final BoardType type;
  final int gridSize;

  BingoBoard({required this.name, required this.type, required this.gridSize});

  BingoBoard copyWith({String? name, BoardType? type, int? gridSize}) {
    return BingoBoard(
      name: name ?? this.name,
      type: type ?? this.type,
      gridSize: gridSize ?? this.gridSize,
    );
  }

  factory BingoBoard.fromJson(Map<String, dynamic> json) =>
      _$BingoBoardFromJson(json);
  Map<String, dynamic> toJson() => _$BingoBoardToJson(this);
}
