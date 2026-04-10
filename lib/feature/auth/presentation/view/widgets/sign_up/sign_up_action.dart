import 'package:cairo_clinics_finder/core/widgets/btn.dart';
import 'package:cairo_clinics_finder/feature/auth/presentation/view_model/signup/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpAction extends StatelessWidget {
  const SignUpAction({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Btn(
      onPressed: () {
        if (cubit.formKey.currentState!.validate()) {
          cubit.signUp();
        }
      },
      text: "Create Account",
    );
  }
}
