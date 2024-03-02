// auth_controller.dart

import 'package:get/get.dart';
import 'package:ktxo/firebase/firestore_service.dart';

class AuthController extends GetxController {
  RxString username = ''.obs;

  void setUsername(String enteredUsername) {
    username.value = enteredUsername;

    // Сохраняем имя пользователя в базе данных
    FirestoreService().saveUsername(enteredUsername);
  }
}
