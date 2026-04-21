import 'package:cairo_clinics_finder/feature/add_clinic/data/repo/add_clinic_repo.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/data/repo/add_clinic_repo_impl.dart';
import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo.dart';
import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:cairo_clinics_finder/feature/favorite/data/repo/fav_repo.dart';
import 'package:cairo_clinics_finder/feature/favorite/data/repo/fav_repo_impl.dart';
import 'package:cairo_clinics_finder/feature/home/data/repo/clinics_repo.dart';
import 'package:cairo_clinics_finder/feature/home/data/repo/clinics_repo_impl.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/data/repo/my_clinic_repo.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/data/repo/my_clinic_repo_impl.dart';
import 'package:cairo_clinics_finder/feature/profile/data/repo/profile_repo.dart';
import 'package:cairo_clinics_finder/feature/profile/data/repo/profile_repo_impl.dart';
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
    () => ClinicsRepoImpl(getIt<FirebaseFirestore>(), getIt<FirebaseAuth>()),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<FirebaseAuth>(), getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(getIt<FirebaseFirestore>(), getIt<FirebaseAuth>()),
  );
  getIt.registerLazySingleton<AddClinicRepo>(
    () => AddClinicRepoImpl(getIt<FirebaseFirestore>(), getIt<FirebaseAuth>()),
  );
  getIt.registerLazySingleton<FavRepo>(
    () => FavRepoImpl(FirebaseFirestore.instance, FirebaseAuth.instance),
  );
  getIt.registerLazySingleton<MyClinicRepo>(
    () => MyClinicRepoImpl(getIt<FirebaseFirestore>(), getIt<FirebaseAuth>()),
  );
}
