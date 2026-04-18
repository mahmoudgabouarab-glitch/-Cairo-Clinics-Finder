part of "routing_import.dart";

abstract class AppRouting {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Splash()),
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
          child: const SignInView(),
        ),
      ),
      GoRoute(
        path: GoTo.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(getIt<AuthRepo>()),
          child: const SignUpView(),
        ),
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
          child: const ForgetPasswordView(),
        ),
      ),
      GoRoute(
        path: GoTo.home,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MapCubit(getIt<ClinicsRepo>())..getMap(),
            ),
            BlocProvider(
              create: (_) => ProfileCubit(getIt<ProfileRepo>())..getProfile(),
            ),
            BlocProvider(create: (_) => FavCubit(getIt<FavRepo>())..getFav()),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: GoTo.details,
        builder: (context, state) {
          final data = state.extra as Map;
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: data['cubit'] as FavCubit),
              BlocProvider(
                create: (context) =>
                    RatingCubit(getIt<ClinicsRepo>())
                      ..getRatingUser(clinicId: data['clinic'].id),
              ),
            ],
            child: DetailsView(clinic: data['clinic'] as ClinicModel),
          );
        },
      ),
      GoRoute(
        path: GoTo.profile,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: state.extra as ProfileCubit),
            BlocProvider(
              create: (context) => SignOutCubit(getIt<ProfileRepo>()),
            ),
          ],
          child: const ProfileView(),
        ),
      ),
      GoRoute(
        path: GoTo.editProfile,
        builder: (context, state) {
          final data = state.extra as Map;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => EditProfileCubit(getIt<ProfileRepo>()),
              ),
              BlocProvider.value(value: data['cubit'] as ProfileCubit),
            ],
            child: EditProfileView(
              profileModel: data['profile'] as ProfileModel,
            ),
          );
        },
      ),

      GoRoute(
        path: GoTo.changePassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ChangePasswordCubit(getIt<ProfileRepo>()),
          child: const ChangePasswordView(),
        ),
      ),

      GoRoute(
        path: GoTo.addClinic,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              AddClinicCubit(getIt<AddClinicRepo>())..loadUserLocation(),
          child: const AddClinicView(),
        ),
      ),
      GoRoute(
        path: GoTo.fav,
        builder: (context, state) => BlocProvider.value(
          value: state.extra as FavCubit,
          child: const FavView(),
        ),
      ),
      GoRoute(path: GoTo.about, builder: (context, state) => const AboutView()),
      GoRoute(
        path: GoTo.myClinics,
        builder: (context, state) => const MyClinicsView(),
      ),
    ],
  );
}
