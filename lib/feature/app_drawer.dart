import 'package:cached_network_image/cached_network_image.dart';
import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_drawer_item.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_loading.dart';
import 'package:cairo_clinics_finder/feature/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF0F4F8),
      child: Column(
        children: [
          _DrawerHeader(),
          DrawerItem(
            icon: Icons.person_outline,
            title: LocaleKeys.drawer_my_profile.tr(),
            onTap: () =>
                context.push(GoTo.profile, extra: context.read<ProfileCubit>()),
          ),
          DrawerItem(
            icon: Icons.medical_services_outlined,
            title: LocaleKeys.drawer_my_clinics.tr(),
            onTap: () => context.push(GoTo.myClinics),
          ),
          DrawerItem(
            icon: Icons.favorite_outline,
            title: LocaleKeys.drawer_favorites.tr(),
            onTap: () => context.push(GoTo.fav),
          ),
          DrawerItem(
            icon: Icons.language,
            title: LocaleKeys.drawer_language.tr(),
            subtitle: Text(
              context.locale.languageCode == 'en' ? 'English' : 'العربية',
            ),
            onTap: () => _showLanguageBottomSheet(context),
          ),
          DrawerItem(
            icon: Icons.info_outline,
            title: LocaleKeys.drawer_about.tr(),
            onTap: () => context.push(GoTo.about),
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColor.drawer.withOpacity(0.75)),
      width: double.infinity,
      padding: EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state is ProfileSuccess
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 45.r,
                      backgroundImage: CachedNetworkImageProvider(
                        state.profile.imageUrl,
                      ),
                    ),
                    spaceH(10),
                    Text(
                      state.profile.name,
                      maxLines: 1,
                      style: AppTextStyles.f18boldBlack.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      state.profile.email,
                      maxLines: 1,
                      style: AppTextStyles.f13MediumBlack.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    spaceH(10),
                    const Divider(color: Colors.blueGrey),
                  ],
                )
              : CustomLoading.cupertinoLoading();
        },
      ),
    );
  }
}

void _showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('English'),
            trailing: context.locale.languageCode == 'en'
                ? Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () async {
              await context.setLocale(const Locale('en'));
              if (context.mounted) Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('العربية'),
            trailing: context.locale.languageCode == 'ar'
                ? Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () async {
              await context.setLocale(const Locale('ar'));
              if (context.mounted) Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
