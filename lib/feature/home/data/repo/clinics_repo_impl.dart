import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'clinics_repo.dart';

class ClinicsRepoImpl implements ClinicsRepo {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<Either<Failure, List<ClinicModel>>> getClinics() async {
    try {
      final snapshot = await _firestore.collection('clinics').get();
      final clinics = snapshot.docs
          .map((doc) => ClinicModel.fromJson(doc.data()))
          .toList();

      return Right(clinics);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
