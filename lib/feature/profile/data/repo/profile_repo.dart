import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/profile/data/model/profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, void>> editProfile({
    required String name,
    required String phone,
  });
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}
