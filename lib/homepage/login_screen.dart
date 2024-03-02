// login_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ktxo/routes/auth_controller.dart';
import 'room_screen.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter your username')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                authController.setUsername(value);
              },
              decoration: InputDecoration(labelText: 'Enter your username'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
  onPressed: () async {
    // Устанавливаем имя пользователя в AuthController
    authController.setUsername(authController.username.value);

    // Переходим на экран RoomScreen
    Get.off(() => RoomScreen());
  },
  child: Text('Start playing'),
),
          ],
        ),
      ),
    );
  }
}
