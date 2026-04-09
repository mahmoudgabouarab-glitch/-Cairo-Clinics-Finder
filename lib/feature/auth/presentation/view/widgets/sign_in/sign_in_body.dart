import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'SignInBody',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
