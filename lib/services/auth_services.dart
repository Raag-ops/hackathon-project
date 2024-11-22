import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register a new user with email, password, and role
  static Future<bool> registerUser(
      String email, String password, String role) async {
    try {
      // Create the user using Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save the user's email and role in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'role': role, // Store the role here
      });

      return true; // Registration was successful
    } on FirebaseAuthException catch (e) {
      // Catch Firebase specific errors
      print('FirebaseAuthException: ${e.message}');
      return false; // Registration failed
    } catch (e) {
      // Catch any other types of errors
      print('Error: $e');
      return false; // Registration failed
    }
  }

  // Log in the user and retrieve their role
  static Future<String?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch user role from Firestore
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists) {
        return userDoc['role']; // Return the user's role
      } else {
        print('User not found in Firestore');
        return null; // User not found
      }
    } on FirebaseAuthException catch (e) {
      // Catch Firebase login errors
      print('FirebaseAuthException: ${e.message}');
      return null; // Return null if login fails
    } catch (e) {
      print('Error: $e');
      return null; // Return null for any other error
    }
  }

  // Log out the user
  static Future<void> logOut() async {
    await _auth.signOut();
  }
}
