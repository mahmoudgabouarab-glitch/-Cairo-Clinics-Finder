import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'clinics_repo.dart';

class ClinicsRepoImpl implements ClinicsRepo {
  final FirebaseFirestore _firestore;
  ClinicsRepoImpl(this._firestore);

  @override
  Future<Either<Failure, List<ClinicModel>>> getClinics() async {
    try {
      var snapshot = await _firestore.collection('clinics').get();
      final clinics = snapshot.docs;
      final result = clinics.map((e) => ClinicModel.fromJson(e)).toList();

      return Right(result);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    }
  }
}
