import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:ktxo/firebase/firebase_service.dart';
import 'package:ktxo/homepage/home_screen.dart';
import 'package:ktxo/homepage/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация Firebase с использованием конфигурации FirebaseOptions
  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: 'AIzaSyB1DZcSGUhS05qB4LJJF0WZV68mD_4A8l0',
    appId: '1:405133718043:web:4f4acf89450b16bbc37ebe',
    messagingSenderId: '405133718043',
    projectId: 'kt-1-dcb75',
    authDomain: 'kt-1-dcb75.firebaseapp.com',
    storageBucket: 'kt-1-dcb75.appspot.com',
    measurementId: 'G-125XE5MK8R',
    ),
  );

  await FirebaseService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Используйте GetMaterialApp вместо MaterialApp
      title: 'Flutter Firebase Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home', // Укажите ваш начальный маршрут
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/login', page: () =>LoginScreen()) // Определите свои страницы
        // Добавьте больше страниц при необходимости
      ],
    );
  }
}