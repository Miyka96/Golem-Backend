# Golem Backend Documentation

<div style="border: 1px solid #ccc; padding: 10px; margin: 10px 0; border-radius: 5px;">

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


</div>

<div style="border: 1px solid #ccc; padding: 10px; margin: 10px 0; border-radius: 5px;">

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

</div>

<div style="border: 1px solid #ccc; padding: 10px; margin: 10px 0; border-radius: 5px;">

## API Endpoints

### Admin API

#### Room Management
- **GET** `/admin/rooms` - Retrieve all Golem rooms with their game table schemas
- **PUT** `/admin/rooms` - Create a new Golem room in the GolemRooms table
- **PATCH** `/admin/rooms/{id}` - Update an existing Golem room
- **DELETE** `/admin/rooms/{id}` - Delete a Golem room

#### Month Management
- **POST** `admin/month-schedule` - Create a new month in the database and generate empty game tables in GolemGameTables, following a specific configuration of selected rooms for the month and their designated days or time slots

#### Game Table Management
- **PUT** `admin/game-tables` 
- **DELETE** `admin/game-tables/{id}` - Delete a game table
- **PATCH** `admin/game-tables-{id}`  - Update a game table with no limitations

### User API

#### Game Table Management
- **GET** `/game-tables/{day}` - Retrieve all game tables for the selected day
- **PATCH** `/game-tables/{id}` - Update a game table to make a reservation with schema limitation / reset removing title, hour and players


</div>
