# Golem Backend Documentation

## Data Models

#### GameTable Model

The `GameTable` model represents individual game tables within rooms.

```dart
{
    String id,                   // Unique ID for daily reservations
    String defaultName,          // Auto-generated {roomName + n}
    String? name,                // Optional custom table name
    String roomName,             // Type of room this table belongs to
    Int seats,                   // Number of seats at the table
    Int reservationTimestamp,    // Reservation timestamp
    List<String> players,        // List of player names
    Int createdAt,               // Creation timestamp
    Int updatedAt                // Last update timestamp
}
```

#### GameTable Schema

The `GameTableSchema` model represents individual game tables within rooms.

```dart
{
    String id,                   // Unique ID for daily reservations
    String defaultName,          // Auto-generated {roomName + n}
    Int seats,                   // Number of seats at the table
}
```

#### Room Model

The `Room` model represents a room containing multiple game tables.

```dart
{
    String name,                             // Type of room (UNIQUE)
    String id,                               // Unique room identifier
    List<GameTableSchema> gameTableSchemas,  // List of game tables in this room
    Int createdAt,                           // Creation timestamp
    Int updatedAt                            // Last update timestamp
}
```


## Database Tables

#### GolemRooms Table

**Table Structure:**

- **Partition Key:** `name`
- **Sort Key:** `id`

*Refers to model: Room*

**Description:** This table stores the configuration schemas for different room types and their associated table configurations.

#### GolemGameTables Table

**Table Structure:**

- **Partition Key:** `reservationTimestamp`
- **Sort Key:** `id`

*Refers to model: GameTable*
