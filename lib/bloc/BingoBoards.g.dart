// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BingoBoards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BingoBoards _$BingoBoardsFromJson(Map<String, dynamic> json) => BingoBoards(
  boards:
      (json['boards'] as List<dynamic>)
          .map((e) => BingoBoard.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$BingoBoardsToJson(BingoBoards instance) =>
    <String, dynamic>{'boards': instance.boards};
