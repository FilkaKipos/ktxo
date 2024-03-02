// room_controller.dart
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ktxo/firebase/firestore_service.dart';

class RoomController extends GetxController {
  final FirestoreService _firestoreService = FirestoreService();

  RxString currentRoom = ''.obs;
  RxList<String> usersInRoom = <String>[].obs;

  Future<void> createRoom(String roomName, String createdBy) async {
    await _firestoreService.createRoom(roomName, createdBy);
  }

  Stream<QuerySnapshot> getRooms() {
    return _firestoreService.getRooms();
  }

  void joinRoom(String roomName) {
    String username = 'User123'; // Замените на актуальное имя пользователя
    _firestoreService.joinRoom(roomName, username);

    currentRoom.value = roomName;
    update();
  }
}
