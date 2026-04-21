import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:dartz/dartz.dart';

abstract class MyClinicRepo {
  Future<Either<Failure, List<ClinicModel>>> getMyClinics();
  Future<Either<Failure, void>> deleteMyClinic(ClinicModel clinic);
}
