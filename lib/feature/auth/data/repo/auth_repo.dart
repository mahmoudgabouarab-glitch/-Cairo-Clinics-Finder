import 'dart:io';

import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    File? imageUrl,
  });

  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> resendVerificationEmail();
  Future<Either<Failure, void>> forgetPassword({required String email});
  Future<bool> isVerified();
  Future<bool> isSignedIn();
}
