import 'dart:io';

import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/core/network/cloudinary_service.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/data/repo/my_clinic_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyClinicRepoImpl implements MyClinicRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  MyClinicRepoImpl(this._firestore, this._auth);

  @override
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
  }) async {
    try {
      final Map<String, dynamic> data = {
        'uid': _auth.currentUser!.uid,
        'name': name,
        'category': category,
        'lat': lat,
        'lng': lng,
        'phone': phone,
        'address': address,
        'hours': hours,
        'breakTime': breakTime,
        'booking': booking,
        'price': price,
        'degree': degree,
        "imageUrl": null,
        "createdAt": FieldValue.serverTimestamp(),
      };
      if (imageUrl != null) {
        final uploadedImage = await CloudinaryService.uploadImage(imageUrl);
        data['imageUrl'] = uploadedImage;
      }
      await _firestore.collection('clinics').add(data);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ClinicModel>>> getMyClinics() async {
    try {
      final query = await _firestore
          .collection('clinics')
          .where('uid', isEqualTo: _auth.currentUser!.uid)
          .orderBy('createdAt', descending: true)
          .get();

      final clinics = query.docs
          .map((doc) => ClinicModel.fromJson(doc.data(), doc.id))
          .toList();

      return Right(clinics);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMyClinic(ClinicModel clinic) async {
    try {
      await _firestore.collection("clinics").doc(clinic.id).delete();
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
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
  }) async {
    try {
      final data = <String, dynamic>{
        'name': name,
        'category': category,
        'phone': phone,
        'address': address,
        'hours': hours,
        'breakTime': breakTime,
        'booking': booking,
        'price': price,
        'degree': degree,
      };
      if (imageUrl != null) {
        final uploadedUrl = await CloudinaryService.uploadImage(imageUrl);
        data["imageUrl"] = uploadedUrl;
      } else if (oldImageUrl != null) {
        data["imageUrl"] = oldImageUrl;
      }
      await _firestore.collection("clinics").doc(id).update(data);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
