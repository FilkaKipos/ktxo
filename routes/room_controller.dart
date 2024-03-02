// room_controller.dart
import 'package:get/get.dart';

class RoomController extends GetxController {
  RxList<String> rooms = <String>[].obs;

  void createRoom(String roomName) {
    // Реализуйте логику создания комнаты
    rooms.add(roomName);
  }
}

