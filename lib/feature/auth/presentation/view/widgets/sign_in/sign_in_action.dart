import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/signin/sign_in_cubit.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInAction extends StatelessWidget {
  const SignInAction({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return Btn(
      onPressed: () {
        if (cubit.formKey.currentState!.validate()) {
          cubit.signIn();
        }
      },
      text: LocaleKeys.signin_sign_in.tr(),
    );
  }
}
