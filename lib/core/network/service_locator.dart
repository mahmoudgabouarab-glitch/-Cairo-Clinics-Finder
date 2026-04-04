import 'package:cairo_clinics_finder/feature/home/data/repo/clinics_repo.dart';
import 'package:cairo_clinics_finder/feature/home/data/repo/clinics_repo_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerLazySingleton<ClinicsRepo>(() => ClinicsRepoImpl());
}
