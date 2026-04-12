import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String message;
  const Failure(this.message);
}

class AuthFirebseFailure extends Failure {
  const AuthFirebseFailure(super.message);
  factory AuthFirebseFailure.fromFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const AuthFirebseFailure('Invalid email address');

      case 'user-not-found':
        return const AuthFirebseFailure('Invalid email or password');

      case 'wrong-password':
        return const AuthFirebseFailure('Invalid email or password');

      case 'email-already-in-use':
        return const AuthFirebseFailure('Email already in use');

      case 'weak-password':
        return const AuthFirebseFailure('Password is too weak');

      case 'user-disabled':
        return const AuthFirebseFailure('This account has been disabled');

      case 'too-many-requests':
        return const AuthFirebseFailure('Too many requests, try again later');

      case 'network-request-failed':
        return const AuthFirebseFailure('Check your internet connection');

      case 'invalid-credential':
        return const AuthFirebseFailure('Invalid credentials');
      case 'requires-recent-login':
        return AuthFirebseFailure("please sign in again");

      default:
        return const AuthFirebseFailure(
          'Something went wrong, please try again',
        );
    }
  }
}

class FirestoreFailure extends Failure {
  const FirestoreFailure(super.message);

  factory FirestoreFailure.fromFirebase(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return const FirestoreFailure('You don’t have permission');

      case 'not-found':
        return const FirestoreFailure('Data not found');

      case 'unavailable':
        return const FirestoreFailure('Service unavailable');

      case 'deadline-exceeded':
        return const FirestoreFailure('Request timeout');

      default:
        return FirestoreFailure(e.message ?? 'Database error');
    }
  }
}
