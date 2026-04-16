import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AuthRepoImpl(this._auth, this._firestore);
  @override
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = UserModel(
        uid: credential.user!.uid,
        name: name,
        email: email,
        phone: phone,
      );
      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(user.toJson());
      await credential.user!.sendEmailVerification();
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFirebseFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.reload();
      if (!credential.user!.emailVerified) {
        return const Left(Failure('Please verify your email first'));
      }
      final doc = await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .get();
      final user = UserModel.fromJson(doc.data()!);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFirebseFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<bool> isVerified() async {
    await _auth.currentUser!.reload();
    return _auth.currentUser!.emailVerified;
  }

  @override
  Future<Either<Failure, void>> resendVerificationEmail() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFirebseFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<bool> isSignedIn() async {
    return _auth.currentUser != null && _auth.currentUser!.emailVerified;
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFirebseFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
