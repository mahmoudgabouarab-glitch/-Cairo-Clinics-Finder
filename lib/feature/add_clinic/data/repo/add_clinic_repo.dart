import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AddClinicRepo {
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
    required String breakTime,
    required String booking,
    required String price,
    required String degree,
  });
}
