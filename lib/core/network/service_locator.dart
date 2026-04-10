import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo.dart';
import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:cairo_clinics_finder/feature/home/data/repo/clinics_repo.dart';
import 'package:cairo_clinics_finder/feature/home/data/repo/clinics_repo_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getIt.registerLazySingleton<ClinicsRepo>(
    () => ClinicsRepoImpl(getIt<FirebaseFirestore>()),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<FirebaseAuth>(), getIt<FirebaseFirestore>()),
  );
}
