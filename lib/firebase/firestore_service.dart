// firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createRoom(String roomName, String createdBy) async {
    await _firestore.collection('rooms').doc(roomName).set({
      'name': roomName,
      'createdBy': createdBy,
      'users': [], // Добавьте список пользователей в комнате
    });
  }

  Stream<QuerySnapshot> getRooms() {
    return _firestore.collection('rooms').snapshots();
  }

  Future<void> joinRoom(String roomName, String username) async {
    // Получаем документ комнаты
    DocumentReference roomRef = _firestore.collection('rooms').doc(roomName);

    // Получаем текущий список пользователей в комнате
    DocumentSnapshot roomSnapshot = await roomRef.get();
    List<String> usersInRoom = List<String>.from(roomSnapshot['users'] ?? []);

    // Добавляем нового пользователя
    usersInRoom.add(username);

    // Обновляем список пользователей в комнате
    await roomRef.update({
      'users': usersInRoom,
    });
  }

  Future<void> saveUsername(String username) async {
    await _firestore.collection('usernames').doc(username).set({
      'username': username,
    });
  }
}
