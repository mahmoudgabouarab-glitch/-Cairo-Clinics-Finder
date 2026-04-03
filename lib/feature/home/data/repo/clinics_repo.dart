import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cairo_clinics_finder/core/errors/failures.dart';

abstract class ClinicsRepo {
  Future<Either<Failure, List<ClinicModel>>> getClinics();
}
