import 'package:cairo_clinics_finder/feature/app_drawer.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/home/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(drawer: AppDrawer(), body: HomeBody());
  }
}
