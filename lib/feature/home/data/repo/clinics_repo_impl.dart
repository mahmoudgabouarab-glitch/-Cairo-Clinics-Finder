import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'clinics_repo.dart';

class ClinicsRepoImpl implements ClinicsRepo {
  final FirebaseFirestore _firestore;
  ClinicsRepoImpl(this._firestore);

  @override
  Stream<Either<Failure, List<ClinicModel>>> getClinics() {
    return _firestore.collection('clinics').snapshots().map((snapshot) {
      try {
        final clinics = snapshot.docs;
        final result = clinics
            .map((e) => ClinicModel.fromJson(e.data(), e.id))
            .toList();
        return Right(result);
      } on FirebaseException catch (e) {
        return Left(FirestoreFailure.fromFirebase(e));
      }
    });
  }
}
