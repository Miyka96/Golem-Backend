// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameTable _$GameTableFromJson(Map<String, dynamic> json) => GameTable(
      id: json['id'] as String,
      defaultName: json['defaultName'] as String,
      name: json['name'] as String?,
      roomName: json['roomName'] as String,
      seats: (json['seats'] as num).toInt(),
      reservationTimestamp: (json['reservationTimestamp'] as num).toInt(),
      players:
          (json['players'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$GameTableToJson(GameTable instance) => <String, dynamic>{
      'id': instance.id,
      'defaultName': instance.defaultName,
      if (instance.name case final value?) 'name': value,
      'roomName': instance.roomName,
      'seats': instance.seats,
      'reservationTimestamp': instance.reservationTimestamp,
      'players': instance.players,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
