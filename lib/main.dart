import 'package:flutter/material.dart';
import 'splash_screen.dart'; 

void main() {
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
      home: Splash(), // Initial screen (Splash Screen)
    );
  }
}
class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login screen"),
      ),
      body: Center(
        child: Text("Welcome to Login screen"),
      ),
    );
  }
}
