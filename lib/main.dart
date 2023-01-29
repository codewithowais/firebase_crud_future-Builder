import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseclass/firebase_options.dart';
import 'package:firebaseclass/screens/home_view.dart';
import 'package:firebaseclass/screens/login_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}
