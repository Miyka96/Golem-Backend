// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_table_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameTableSchema _$GameTableSchemaFromJson(Map<String, dynamic> json) =>
    GameTableSchema(
      id: json['id'] as String,
      defaultName: json['defaultName'] as String,
      seats: (json['seats'] as num).toInt(),
    );

Map<String, dynamic> _$GameTableSchemaToJson(GameTableSchema instance) =>
    <String, dynamic>{
      'id': instance.id,
      'defaultName': instance.defaultName,
      'seats': instance.seats,
    };
