// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BingoBoard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BingoBoard _$BingoBoardFromJson(Map<String, dynamic> json) => BingoBoard(
  name: json['name'] as String,
  type: $enumDecode(_$BoardTypeEnumMap, json['type']),
  gridSize: (json['gridSize'] as num).toInt(),
);

Map<String, dynamic> _$BingoBoardToJson(BingoBoard instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$BoardTypeEnumMap[instance.type]!,
      'gridSize': instance.gridSize,
    };

const _$BoardTypeEnumMap = {
  BoardType.names: 'names',
  BoardType.numbers: 'numbers',
};
