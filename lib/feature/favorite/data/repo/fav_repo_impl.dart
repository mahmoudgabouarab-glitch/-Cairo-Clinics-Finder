import 'package:cairo_clinics_finder/core/errors/failures.dart';
import 'package:cairo_clinics_finder/feature/favorite/data/repo/fav_repo.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavRepoImpl implements FavRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  FavRepoImpl(this._firestore, this._auth);

  String get _uid => _auth.currentUser!.uid;

  CollectionReference get _favCollection =>
      _firestore.collection('users').doc(_uid).collection('favorites');

  @override
  Future<Either<Failure, void>> addFav(ClinicModel clinic) async {
    try {
      await _favCollection.doc(clinic.id).set(clinic.toMap());
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFav(String clinicId) async {
    try {
      await _favCollection.doc(clinicId).delete();
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure.fromFirebase(e));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<ClinicModel>>> getFav() {
    return _favCollection.snapshots().map((snapshot) {
      try {
        final clinics = snapshot.docs
            .map(
              (doc) => ClinicModel.fromJson(
                doc.data() as Map<String, dynamic>,
                doc.id,
              ),
            )
            .toList();
        return Right(clinics);
      } on FirebaseException catch (e) {
        return Left(FirestoreFailure.fromFirebase(e));
      } catch (e) {
        return Left(Failure(e.toString()));
      }
    });
  }
}
