import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'clinics_repo.dart';

class ClinicsRepoImpl implements ClinicsRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ClinicsRepoImpl(this._firestore, this._auth);

  @override
  Stream<Either<Failure, List<ClinicModel>>> getClinics() {
    return _firestore.collection('clinics').snapshots().map((snapshot) {
      try {
        final result = snapshot.docs
            .map((e) => ClinicModel.fromJson(e.data(), e.id))
            .toList();

        return Right(result);
      } on FirebaseException catch (e) {
        return Left(FirestoreFailure.fromFirebase(e));
      }
    });
  }

  @override
  Future<Either<Failure, void>> addRating({
    required String clinicId,
    required double rating,
  }) async {
    try {
      final uid = _auth.currentUser!.uid;
      final clinicRef = _firestore.collection('clinics').doc(clinicId);
      final userRatingRef = clinicRef.collection("ratings").doc(uid);

      await _firestore.runTransaction((transaction) async {
        final clinicSnapshot = await transaction.get(clinicRef);
        final data = clinicSnapshot.data() ?? {};
        final stats = data['ratingStats'] as Map<String, dynamic>? ?? {};
        final currentTotal = (stats['total'] as num?)?.toDouble() ?? 0.0;
        final currentCount = stats['count'] as int? ?? 0;

        final userSnapshot = await transaction.get(userRatingRef);
        final oldRating = userSnapshot.exists
            ? (userSnapshot['rating'] as num).toDouble()
            : 0.0;

        final isNew = !userSnapshot.exists;
        final diff = rating - oldRating;

        transaction.set(userRatingRef, {
          'rating': rating,
          'updatedAt': FieldValue.serverTimestamp(),
        });

        final newTotal = currentTotal + diff;
        final newCount = isNew ? currentCount + 1 : currentCount;

        transaction.update(clinicRef, {
          'ratingStats': {'total': newTotal, 'count': newCount},
        });
      });
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    }
  }

  @override
  Future<Either<Failure, RatingUser>> getRating({
    required String clinicId,
  }) async {
    try {
      final uid = _auth.currentUser!.uid;
      final clinicRef = _firestore.collection('clinics').doc(clinicId);
      final userRatingRef = clinicRef.collection("ratings").doc(uid);
      final doc = await userRatingRef.get();
      final userRating = RatingUser.fromJson(doc.data(), doc.id);
      return Right(userRating);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    }
  }
}
