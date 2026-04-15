import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:cairo_clinics_finder/feature/favorite/presentation/view/widgets/fav_body.dart';
import 'package:flutter/material.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Favorites"),
      body: const FavBody(),
    );
  }
}


