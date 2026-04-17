import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cairo_clinics_finder/core/errors/failures.dart';

abstract class ClinicsRepo {
  Stream<Either<Failure, List<ClinicModel>>> getClinics();
  Future<Either<Failure, void>> addRating({
    required String clinicId,
    required double rating,
  });
  Future<Either<Failure, RatingUser>> getRating({required String clinicId});
}
