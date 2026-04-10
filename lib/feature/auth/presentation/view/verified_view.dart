import 'package:cairo_clinics_finder/feature/auth/presentation/view/widgets/verified/verified_body.dart';
import 'package:flutter/material.dart';

class VerifiedView extends StatelessWidget {
  final String email;
  const VerifiedView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: VerifiedBody(email: email));
  }
}
