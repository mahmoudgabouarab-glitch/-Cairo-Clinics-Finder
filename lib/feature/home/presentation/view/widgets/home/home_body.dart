import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/home/bottom_panel.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/home/go_to_my_location_btn.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/home/map_widget.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/home/top_bar.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [MapWidget(), GoToMyLocationBtn(), TopBar(), BottomPanel()],
    );
  }
}
