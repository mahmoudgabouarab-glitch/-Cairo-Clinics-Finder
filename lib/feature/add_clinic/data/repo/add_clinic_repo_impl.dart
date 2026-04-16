import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/data/repo/add_clinic_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddClinicRepoImpl implements AddClinicRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  AddClinicRepoImpl(this._firestore, this._auth);
  @override
  Future<Either<Failure, void>> addClinic({
    required String name,
    required String category,
    required double lat,
    required double lng,
    required String phone,
    required String address,
    required double rating,
    required int reviewCount,
    required String hours,
  }) async {
    try {
      await _firestore.collection('clinics').add({
        'uid': _auth.currentUser!.uid,
        'name': name,
        'category': category,
        'lat': lat,
        'lng': lng,
        'phone': phone,
        'address': address,
        'rating': rating,
        'reviewCount': reviewCount,
        'hours': hours,
      });
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
