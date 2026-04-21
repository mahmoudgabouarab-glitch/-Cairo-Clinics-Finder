import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/data/repo/my_clinic_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyClinicRepoImpl implements MyClinicRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  MyClinicRepoImpl(this._firestore, this._auth);

  @override
  Future<Either<Failure, List<ClinicModel>>> getMyClinics() async {
    try {
      final query = await _firestore
          .collection('clinics')
          .where('uid', isEqualTo: _auth.currentUser!.uid)
          .orderBy('createdAt', descending: true)
          .get();

      final clinics = query.docs
          .map((doc) => ClinicModel.fromJson(doc.data(), doc.id))
          .toList();

      return Right(clinics);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMyClinic(ClinicModel clinic) async {
    try {
      await _firestore.collection("clinics").doc(clinic.id).delete();
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
