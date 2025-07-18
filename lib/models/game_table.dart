import 'package:json_annotation/json_annotation.dart';
part 'game_table.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class GameTable {
  String id; // Unique ID for daily reservations
  String defaultName; // Auto-generated {roomName + n}
  String? name; // Optional custom table name
  String roomName; // Type of room this table belongs to
  int seats; // Number of seats at the table
  int reservationTimestamp; // Reservation timestamp
  List<String> players; // List of player names
  int createdAt; // Creation timestamp
  int updatedAt; // Last update timestamp

  GameTable({
    required this.id,
    required this.defaultName,
    this.name,
    required this.roomName,
    required this.seats,
    required this.reservationTimestamp,
    required this.players,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GameTable.fromJson(Map<String, dynamic> json) =>
      _$GameTableFromJson(json);

  Map<String, dynamic> toJson() => _$GameTableToJson(this);
}
