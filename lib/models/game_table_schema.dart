import 'package:json_annotation/json_annotation.dart';
part 'game_table_schema.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class GameTableSchema {
  String id; // Unique ID for daily reservations
  String defaultName; // Auto-generated {roomName + n}
  int seats; // Number of seats at the table

  GameTableSchema({
    required this.id,
    required this.defaultName,
    required this.seats,
  });

  factory GameTableSchema.fromJson(Map<String, dynamic> json) =>
      _$GameTableSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$GameTableSchemaToJson(this);
}
