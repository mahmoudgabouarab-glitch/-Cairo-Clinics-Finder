import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
  factory ServerFailure.fromFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const ServerFailure('Invalid email address');

      case 'user-not-found':
        return const ServerFailure('Invalid email or password');

      case 'wrong-password':
        return const ServerFailure('Invalid email or password');

      case 'email-already-in-use':
        return const ServerFailure('Email already in use');

      case 'weak-password':
        return const ServerFailure('Password is too weak');

      case 'user-disabled':
        return const ServerFailure('This account has been disabled');

      case 'too-many-requests':
        return const ServerFailure('Too many requests, try again later');

      case 'network-request-failed':
        return const ServerFailure('Check your internet connection');

      case 'invalid-credential':
        return const ServerFailure('Invalid credentials');

      default:
        return const ServerFailure('Something went wrong, please try again');
    }
  }
}
