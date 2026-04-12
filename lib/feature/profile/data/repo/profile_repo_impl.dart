import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:cairo_clinics_finder/feature/profile/data/repo/profile_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepoImpl implements ProfileRepo {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  const ProfileRepoImpl(this._firestore, this._auth);

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final user = _auth.currentUser!.uid;
      final data = await _firestore.collection('users').doc(user).get();
      return Right(ProfileModel.fromJson(data.data()!));
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editProfile({
    required String name,
    required String phone,
  }) async {
    try {
      final user = _auth.currentUser!.uid;
      await _firestore.collection('users').doc(user).update({
        'name': name,
        'phone': phone,
      });
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final user = _auth.currentUser!;
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFirebseFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _auth.signOut();
      return Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFirebseFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
