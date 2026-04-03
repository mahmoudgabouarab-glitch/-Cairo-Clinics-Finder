import 'package:cairo_clinics_finder/clinics_finder_app.dart';
import 'package:cairo_clinics_finder/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ClinicsFinderApp());
}
