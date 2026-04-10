import 'package:cairo_clinics_finder/clinics_finder_app.dart';
import 'package:cairo_clinics_finder/core/network/service_locator.dart';
import 'package:cairo_clinics_finder/core/utils/bloc_observer.dart';
import 'package:cairo_clinics_finder/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const ClinicsFinderApp());
}
