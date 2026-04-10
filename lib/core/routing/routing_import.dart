import 'package:cairo_clinics_finder/core/network/service_locator.dart';
import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/feature/auth/data/repo/auth_repo.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/Verified_view.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/sign_in_view.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/sign_up_view.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/signin/sign_in_cubit.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/signup/sign_up_cubit.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/details_view.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/home_view.dart';
import 'package:cairo_clinics_finder/feature/onbording/onbording.dart';
import 'package:cairo_clinics_finder/feature/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'app_routing.dart';
