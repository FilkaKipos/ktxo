// auth_controller.dart
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxString username = ''.obs;

  void setUsername(String enteredUsername) {
    username.value = enteredUsername;
  }
}
