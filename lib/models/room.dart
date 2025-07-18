import 'package:json_annotation/json_annotation.dart';
import 'game_table_schema.dart';
part 'room.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Room {
  String name; // Type of room (UNIQUE)
  String id; // Unique room identifier
  List<GameTableSchema> gameTableSchemas; // List of game tables in this room
  int createdAt; // Creation timestamp
  int updatedAt; // Last update timestamp

  Room({
    required this.name,
    required this.id,
    required this.gameTableSchemas,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
