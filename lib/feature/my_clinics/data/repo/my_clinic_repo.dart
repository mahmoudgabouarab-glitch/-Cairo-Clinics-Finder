import 'dart:io';

import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:dartz/dartz.dart';

abstract class MyClinicRepo {
  Future<Either<Failure, void>> addClinic({
    required String name,
    required String category,
    required double lat,
    required double lng,
    required String phone,
    required String address,
    required String hours,
    required String breakTime,
    required String booking,
    required String price,
    required String degree,
    File? imageUrl,
  });
  Future<Either<Failure, List<ClinicModel>>> getMyClinics();
  Future<Either<Failure, void>> deleteMyClinic(ClinicModel clinic);
  Future<Either<Failure, void>> editMyClinic({
    required String name,
    required String category,
    required String phone,
    required String address,
    required String hours,
    required String breakTime,
    required String booking,
    required String price,
    required String degree,
    String? oldImageUrl,
    File? imageUrl,
    required String id,
  });
}
