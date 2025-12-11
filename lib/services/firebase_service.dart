import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance.ref();

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream of auth changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign up with email and password
  Future<UserCredential?> signUp(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Sign up error: $e');
      return null;
    }
  }

  // Sign in with email and password
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Sign in error: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign out error: $e');
    }
  }

  // Save user restaurant selection to database
  Future<void> saveRestaurantSelection(String userId, String restaurantId, String restaurantName) async {
    try {
      final timestamp = DateTime.now();
      await _database.child('users/$userId/selected_restaurant').set({
        'id': restaurantId,
        'name': restaurantName,
        'timestamp': timestamp.toIso8601String(),
      });
    } catch (e) {
      print('Error saving restaurant selection: $e');
    }
  }

  // Get user restaurant selection
  Future<Map?> getUserRestaurantSelection(String userId) async {
    try {
      final snapshot = await _database.child('users/$userId/selected_restaurant').get();
      if (snapshot.exists) {
        return snapshot.value as Map?;
      }
      return null;
    } catch (e) {
      print('Error getting restaurant selection: $e');
      return null;
    }
  }

  // Check if restaurant selection has expired (12 hours)
  bool isSelectionExpired(Map restaurantData) {
    final timestamp = DateTime.parse(restaurantData['timestamp'] as String);
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    return difference.inHours >= 12;
  }

  // Add friend
  Future<void> addFriend(String userId, String friendId) async {
    try {
      await _database.child('users/$userId/friends/$friendId').set(true);
    } catch (e) {
      print('Error adding friend: $e');
    }
  }
}
