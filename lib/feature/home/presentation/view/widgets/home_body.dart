import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/bottom_panel.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/map_widget.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [MapWidget(), TopBar(), BottomPanel()]);
  }
}
