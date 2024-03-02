// home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Переход на экран ввода никнейма
            Get.to(() => LoginScreen());
          },
          child: Text('Play'),
        ),
      ),
    );
  }
}
