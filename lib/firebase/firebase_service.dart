import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp();
      print('Firebase initialization successful');
    } catch (e) {
      print('Error initializing Firebase: $e');
    }
  }
}
