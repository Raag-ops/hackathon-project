import 'package:flutter/material.dart';
import '../../services/auth_services.dart';
import '../../dashboards/admin_dashboard.dart';
import '../../dashboards/user_dashboard.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Login(
              emailController: emailController,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  Login({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color(0xFFFEFAE0)),
          child: Stack(
            children: [
              // Circular Decorations
              Positioned(
                left: -99,
                top: -109,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 70,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: const ShapeDecoration(
                          color: Color(0x7C97BE5A),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      top: 0,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: const ShapeDecoration(
                          color: Color(0x7C97BE5A),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Welcome Back Text
              Positioned(
                left: 108,
                top: 140,
                child: const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Email Input Field
              Positioned(
                left: 24,
                top: 441,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
              ),
              // Password Input Field
              Positioned(
                left: 24,
                top: 512,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
              ),
              // Forgot Password
              Positioned(
                left: 124,
                top: 616,
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Color(0xFF97BE5A),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Sign In Button
              Positioned(
                left: 25,
                top: 656,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF97BE5A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;

                    // Simulated authentication logic
                    String role = await AuthService.authenticate(email, password);

                    if (role == 'admin') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => AdminDashboard()),
                      );
                    } else if (role == 'user') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => UserDashboard()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid credentials or role')),
                      );
                    }
                  },
                  child: const Text('Sign In'),
                ),
              ),
              // Sign-Up Link
              Positioned(
                left: 61,
                top: 747,
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(color: Color(0xFF97BE5A)),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
