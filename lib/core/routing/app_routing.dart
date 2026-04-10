part of "routing_import.dart";

abstract class AppRouting {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => Splash()),
      GoRoute(
        path: GoTo.onBording,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const Onboarding(),
          transitionsBuilder: (context, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 1300),
        ),
      ),
      GoRoute(
        path: GoTo.signIn,
        builder: (context, state) => BlocProvider(
          create: (context) => SignInCubit(getIt<AuthRepo>()),
          child: SignInView(),
        ),
      ),
      GoRoute(
        path: GoTo.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(getIt<AuthRepo>()),
          child: SignUpView(),
        ),
      ),
      GoRoute(path: GoTo.home, builder: (context, state) => HomeView()),
      GoRoute(
        path: GoTo.details,
        builder: (context, state) =>
            DetailsView(clinic: state.extra as ClinicModel),
      ),
      GoRoute(
        path: GoTo.verified,
        builder: (context, state) => BlocProvider(
          create: (context) => VerifiedCubit(getIt<AuthRepo>()),
          child: VerifiedView(email: state.extra as String),
        ),
      ),
      GoRoute(
        path: GoTo.forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgetPasswordCubit(getIt<AuthRepo>()),
          child: ForgetPasswordView(),
        ),
      ),
    ],
  );
}
