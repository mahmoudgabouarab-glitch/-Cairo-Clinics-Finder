import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:dartz/dartz.dart';

abstract class FavRepo {
  Future<Either<Failure, void>> addFav(ClinicModel clinic);
  Future<Either<Failure, void>> removeFav(String clinicId);
  Stream<Either<Failure, List<ClinicModel>>> getFav();
}
