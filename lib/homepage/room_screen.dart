// room_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktxo/routes/room_controller.dart';
import 'package:ktxo/homepage/game_screen.dart'; // Добавьте импорт для GameScreen

class RoomScreen extends StatelessWidget {
  final RoomController roomController = Get.put(RoomController());
  final TextEditingController roomNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rooms')),
      body: StreamBuilder(
        stream: roomController.getRooms(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var rooms = snapshot.data!.docs;
            return ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                var room = rooms[index];
                return ListTile(
                  title: Text(room['name']),
                  subtitle: Text('Created by: ${room['createdBy']}'),
                  onTap: () {
                    String roomName = room['name'];
                    roomController.joinRoom(roomName);
                    Get.to(() => GameScreen(roomName: roomName));
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateRoomDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showCreateRoomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create a new room'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: roomNameController,
                decoration: InputDecoration(labelText: 'Room Name'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String roomName = roomNameController.text.trim();
                  if (roomName.isNotEmpty) {
                    roomController.createRoom(roomName, 'User123'); // You can replace 'User123' with the actual user ID or name
                    Navigator.pop(context); // Close the dialog
                  }
                },
                child: Text('Create Room'),
              ),
            ],
          ),
        );
      },
    );
  }
}
