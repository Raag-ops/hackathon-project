import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase before runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phalaun',
      theme: ThemeData(
        primarySwatch: Colors.green, // You can change the theme color
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Splash(), // Initial screen (Splash Screen)
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login screen"),
      ),
      body: const Center(
        child: Text("Welcome to Login screen"),
      ),
    );
  }
}
