import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  // Method to authenticate user with email and password
  static Future<String> authenticate(String email, String password) async {
    try {
      // Attempt to sign in with provided email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Fetch user data from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      // Check if the user document exists and contains the role field
      if (userDoc.exists && userDoc.data() != null && userDoc['role'] != null) {
        return userDoc['role']; // Return the role (admin, user, etc.)
      } else {
        // If user document doesn't exist or role is missing, return error
        return 'role_not_found';
      }
    } catch (e) {
      // Print the error and return a general error message
      print("Authenticate Error: $e");
      return 'error';
    }
  }
}

