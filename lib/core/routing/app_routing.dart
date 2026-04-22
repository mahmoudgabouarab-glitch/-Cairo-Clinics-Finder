part of "routing_import.dart";

abstract class AppRouting {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      // Splash Route
      GoRoute(path: '/', builder: (context, state) => const Splash()),
      // Onboarding Route
      GoRoute(
        path: GoTo.onBording,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const Onboarding(),
          transitionsBuilder: (context, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 1300),
        ),
      ),
      // SignIn Route
      GoRoute(
        path: GoTo.signIn,
        builder: (context, state) => BlocProvider(
          create: (context) => SignInCubit(getIt<AuthRepo>()),
          child: const SignInView(),
        ),
      ),
      // SignUp Route
      GoRoute(
        path: GoTo.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(getIt<AuthRepo>()),
          child: const SignUpView(),
        ),
      ),
      // Verify Route
      GoRoute(
        path: GoTo.verified,
        builder: (context, state) => BlocProvider(
          create: (context) => VerifiedCubit(getIt<AuthRepo>()),
          child: VerifiedView(email: state.extra as String),
        ),
      ),
      // ForgetPassword Route
      GoRoute(
        path: GoTo.forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgetPasswordCubit(getIt<AuthRepo>()),
          child: const ForgetPasswordView(),
        ),
      ),
      // Home Route
      GoRoute(
        path: GoTo.home,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MapCubit(getIt<ClinicsRepo>())..getMap(),
            ),
            BlocProvider(
              lazy: false,
              create: (_) => ProfileCubit(getIt<ProfileRepo>())..getProfile(),
            ),
          ],
          child: const HomeView(),
        ),
      ),
      // Details Route
      GoRoute(
        path: GoTo.details,
        builder: (context, state) {
          final data = state.extra as Map;
          return BlocProvider(
            create: (context) =>
                RatingCubit(getIt<ClinicsRepo>())
                  ..getRatingUser(clinicId: data['clinic'].id),
            child: DetailsView(clinic: data['clinic'] as ClinicModel),
          );
        },
      ),
      // Profile Route
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
      // EditProfile Route
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
            child: EditProfileView(userModel: data['profile'] as UserModel),
          );
        },
      ),
      // ChangePassword Route
      GoRoute(
        path: GoTo.changePassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ChangePasswordCubit(getIt<ProfileRepo>()),
          child: const ChangePasswordView(),
        ),
      ),
      // AddClinic Route
      GoRoute(
        path: GoTo.addClinic,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AddClinicCubit(getIt<MyClinicRepo>())..loadUserLocation(),
            ),
            BlocProvider.value(value: state.extra as MyClinicCubit),
          ],
          child: const AddClinicView(),
        ),
      ),
      // Fav Route
      GoRoute(path: GoTo.fav, builder: (context, state) => const FavView()),
      // About Route
      GoRoute(path: GoTo.about, builder: (context, state) => const AboutView()),
      // My Clinics Route
      GoRoute(
        path: GoTo.myClinics,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              MyClinicCubit(getIt<MyClinicRepo>())..getMyClinics(),
          child: const MyClinicsView(),
        ),
      ),
    ],
  );
}
