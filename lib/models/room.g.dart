// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      name: json['name'] as String,
      id: json['id'] as String,
      gameTableSchemas: (json['gameTableSchemas'] as List<dynamic>)
          .map((e) => GameTableSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'gameTableSchemas':
          instance.gameTableSchemas.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
