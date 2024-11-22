import 'package:flutter/material.dart';
import 'package:phalaun/authentication/login_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(color: Color(0xFFFEFAE0)),
        child: Stack(
          children: [
            // Circular Decorations
            Positioned(
              left: -screenWidth * 0.26,
              top: -screenHeight * 0.13,
              child: Container(
                width: screenWidth * 0.77,
                height: screenHeight * 0.33,
                decoration: const ShapeDecoration(
                  color: Color.fromARGB(167, 151, 190, 90),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.24,
              top: -screenHeight * 0.13,
              child: Container(
                width: screenWidth * 0.53,
                height: screenHeight * 0.33,
                decoration: const ShapeDecoration(
                  color: Color.fromARGB(167, 151, 190, 90),
                  shape: OvalBorder(),
                ),
              ),
            ),
            // Text for App Description
            Positioned(
              left: screenWidth * 0.13,
              top: screenHeight * 0.61,
              child: SizedBox(
                width: screenWidth * 0.75,
                child: Text(
                  '“Phalaun” is an initiative that supports \n the Clean Nepal, Green Nepal cause \n by facilitating easier and efficient \n domestic waste collection and \n disposal.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.74),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: 0.78,
                  ),
                ),
              ),
            ),
            // Title Text
            Positioned(
              left: screenWidth * 0.18,
              top: screenHeight * 0.53,
              child: SizedBox(
                width: screenWidth * 0.66,
                child: const Text(
                  'Nepal’s First Waste\nManagement App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    letterSpacing: 1.08,
                  ),
                ),
              ),
            ),
            // Get Started Button
            Positioned(
              left: screenWidth * 0.07,
              top: screenHeight * 0.81,
              child: SizedBox(
                width: screenWidth * 0.86,
                height: 62,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF97BE5A), // Updated to backgroundColor
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFEFAE0), // Text color
                      fontSize: 18, // Font size
                      fontFamily: 'Poppins', // Font family
                      fontWeight: FontWeight.w600, // Font weight
                      letterSpacing: 1.08, // Letter spacing
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}