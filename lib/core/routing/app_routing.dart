import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/sign_in_view.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view/sign_up_view.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/details_view.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/home_view.dart';
import 'package:cairo_clinics_finder/feature/onbording/onbording.dart';
import 'package:cairo_clinics_finder/feature/splash/splash.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouting {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => Splash()),
      GoRoute(path: Go.onBording, builder: (context, state) => Onboarding()),
      GoRoute(path: Go.signIn, builder: (context, state) => SignInView()),
      GoRoute(path: Go.signUp, builder: (context, state) => SignUpView()),
      GoRoute(path: Go.home, builder: (context, state) => HomeView()),
      GoRoute(
        path: Go.details,
        builder: (context, state) =>
            DetailsView(clinic: state.extra as ClinicModel),
      ),
    ],
  );
}
